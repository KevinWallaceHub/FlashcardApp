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
        String sql = "Select * FROM flashcards";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

        while(results.next()){
            allCards.add(mapRowToFlashCard(results));
        }
        return allCards;
    }


    private FlashCard mapRowToFlashCard(SqlRowSet row){
        FlashCard flashCard = new FlashCard();
        flashCard.setUserId(row.getLong("user_id"));
        flashCard.setCardId(row.getLong("card_id"));
        flashCard.setQuestionSide(row.getString("question_side"));
        flashCard.setAnswerSide(row.getString("answer_side"));
        if(row.getString("keywords") != null) {
            flashCard.setKeywords(List.of(row.getString("keywords").split(" ")));
        }
        return flashCard;


    }

}
