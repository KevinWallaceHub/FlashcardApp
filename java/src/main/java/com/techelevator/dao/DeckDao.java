package com.techelevator.dao;

import com.techelevator.model.Deck;
import com.techelevator.model.FlashCard;

import java.util.List;

public interface DeckDao {

    Deck  createNewDeck(Deck deck);
    List<Deck> findAllDecks();
    void addCardToDeck(int deckId, FlashCard card);
    void deleteCardFromDeck(long deckId, long cardId);

}
