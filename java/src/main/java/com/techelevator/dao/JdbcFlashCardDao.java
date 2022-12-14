package com.techelevator.dao;

import com.techelevator.model.FlashCard;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcFlashCardDao implements FlashCardDao {


    private final JdbcTemplate jdbcTemplate;

    public JdbcFlashCardDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<FlashCard> findAllCards() {
        List<FlashCard> allCards = new ArrayList<>();
        String sql = "Select user_id, card_id, question_side, answer_side, image_url, keywords FROM flashcards";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

        while(results.next()){
            allCards.add(mapRowToFlashCard(results));
        }
        return allCards;
    }

    @Override
    public List<FlashCard> findAllCardsInDeck(long deck_id) {
        List<FlashCard> deckOfCards = new ArrayList<>();
        String sql= "SELECT flashcards.user_id, flashcards.card_id, question_side, answer_side, keywords, image_url " +
                "FROM flashcards " +
                "JOIN deckard ON flashcards.card_id=deckard.card_id " +
                "JOIN decks ON deckard.deck_id=decks.deck_id " +
                "WHERE decks.deck_id=?";
        SqlRowSet rows = jdbcTemplate.queryForRowSet(sql,deck_id);
        while(rows.next()){
            deckOfCards.add(mapRowToFlashCard(rows));
        }
        return deckOfCards;
    }

    @Override
    public FlashCard createNewFlashCard(FlashCard flashCard) {
        String sql = "INSERT INTO flashcards(user_id, card_id, question_side, answer_side, keywords) " +
                "VALUES (?, DEFAULT, ?,?,?) RETURNING card_id";
        Integer id = jdbcTemplate.queryForObject(sql , Integer.class, flashCard.getUserId(),  flashCard.getQuestionSide(),
                flashCard.getAnswerSide(), flashCard.getKeywords());
        flashCard.setCardId(id);
        return flashCard;
    }

    @Override
    public void updateFlashCard(FlashCard flashCard) {
        String sql = "UPDATE flashcards SET question_side = ?, answer_side = ?, keywords = ?, image_url = ? WHERE card_id = ?";
        jdbcTemplate.update(sql, flashCard.getQuestionSide(), flashCard.getAnswerSide(), flashCard.getKeywords(), flashCard.getImageUrl(), flashCard.getCardId());
    }

    @Override
    public void deleteFlashCard(int flashCardId) {
        String sql = "DELETE FROM flashcards WHERE card_id = ?";
        jdbcTemplate.update(sql, flashCardId);
    }


    private FlashCard mapRowToFlashCard(SqlRowSet row){
        FlashCard flashCard = new FlashCard();
        flashCard.setUserId(row.getLong("user_id"));
        flashCard.setCardId(row.getLong("card_id"));
        flashCard.setQuestionSide(row.getString("question_side"));
        flashCard.setAnswerSide(row.getString("answer_side"));
        if (row.getString("keywords") != null) {
            flashCard.setKeywords(row.getString("keywords"));
        }
        if(row.getString("image_url") != null) {
            flashCard.setImageUrl(row.getString("image_url"));
        };
        return flashCard;


    }

}
