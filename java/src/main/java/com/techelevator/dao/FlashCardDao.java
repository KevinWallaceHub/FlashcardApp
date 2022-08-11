package com.techelevator.dao;

import com.techelevator.model.FlashCard;

import java.util.List;

public interface FlashCardDao {

    List<FlashCard> findAllCards();

    List<FlashCard> findAllCardsInDeck(long deck_id);

    FlashCard createNewFlashCard(FlashCard flashCard);

    void updateFlashCard(FlashCard flashCard);

    void deleteFlashCard(int flashCardId);
}
