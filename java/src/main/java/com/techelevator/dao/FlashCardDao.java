package com.techelevator.dao;

import com.techelevator.model.FlashCard;

import java.util.List;

public interface FlashCardDao {

    List<FlashCard> findAllCards();
}
