package com.techelevator.dao;

import com.techelevator.model.Deck;
import com.techelevator.model.FlashCard;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcDeckDao implements DeckDao{

    private final JdbcTemplate jdbcTemplate;

    public JdbcDeckDao(JdbcTemplate jdbcTemplate) {this.jdbcTemplate = jdbcTemplate; }

    @Override
    public Deck createNewDeck(Deck deck) {
       String sql = "INSERT INTO decks(deck_id, user_id, name) VALUES(DEFAULT, ?, ?) RETURNING deck_id";
       Integer id = jdbcTemplate.queryForObject(sql, Integer.class, deck.getUserId(), deck.getName());
       deck.setDeckId(id);
       return deck;
    }


    @Override
    public List<Deck> findAllDecks() {
        List<Deck> allDecks = new ArrayList<>();
        String sql = "SELECT deck_id, user_id, name FROM decks";

        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);

        while(results.next()){
            allDecks.add(mapRowToDeck(results));
        }
        return allDecks;
    }

    @Override
    public void addCardToDeck(int deck_id, FlashCard card) {
        String sql = "INSERT INTO deckard (deck_id, card_id) " +
                "VALUES (?, ?) RETURNING deck_id";
        Long deckId = jdbcTemplate.queryForObject(sql, Long.class, deck_id, card.getCardId());
//        deck.getDeckId(deckId);
    }

    @Override
    public void deleteCardFromDeck(long deckId, long cardId) {
        String sql = "DELETE FROM deckard WHERE card_id = ? AND deck_id = ?";
        jdbcTemplate.update(sql, cardId, deckId);
    }

    private Deck mapRowToDeck(SqlRowSet row) {
        Deck deck = new Deck();
        deck.setUserId(row.getLong("user_id"));
        deck.setDeckId(row.getLong("deck_id"));
        deck.setName(row.getString("name"));

                return deck;

    }

}
