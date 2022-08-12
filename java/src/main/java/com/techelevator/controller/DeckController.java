package com.techelevator.controller;

import com.techelevator.dao.DeckDao;
import com.techelevator.dao.FlashCardDao;
import com.techelevator.model.Deck;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import com.techelevator.model.FlashCard;
import java.util.List;

@RestController
@CrossOrigin
public class DeckController {

    private DeckDao deckDao;
    private FlashCardDao flashcardDao;
    public DeckController(DeckDao deckDao, FlashCardDao flashcardDao){
        this.deckDao =deckDao;
        this.flashcardDao=flashcardDao;
    }

    @RequestMapping(path ="/decks", method = RequestMethod.GET)
    public List<Deck> showAllDecks() {
        return deckDao.findAllDecks();
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/decks", method= RequestMethod.POST)
    public Deck addNewDeck(@RequestBody Deck deck) {
        return deckDao.createNewDeck(deck);
    }

    @RequestMapping(path = "/decks/{id}", method = RequestMethod.GET)
    public List<FlashCard> showDeckCards(@PathVariable("id") long deck_Id) {
        return flashcardDao.findAllCardsInDeck(deck_Id);
    }
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/decks/{deckId}", method = RequestMethod.POST)
    public void addCardToDeck( @PathVariable("deckId") int deckId ,@RequestBody FlashCard flashCard){
       deckDao.addCardToDeck(deckId, flashCard);
    }
}
