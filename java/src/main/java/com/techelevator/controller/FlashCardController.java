package com.techelevator.controller;

import com.techelevator.dao.FlashCardDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.FlashCard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
public class FlashCardController {

    private FlashCardDao flashCardDao;
    private UserDao userDao;

    public FlashCardController(FlashCardDao flashCardDao) {
        this.flashCardDao = flashCardDao;
    }


    @RequestMapping(path = "/cards", method = RequestMethod.GET)
    public List<FlashCard> showAllCards() {
        return flashCardDao.findAllCards();
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/cards", method = RequestMethod.POST)
    public FlashCard addNewCard(@RequestBody FlashCard flashCard, Principal principal){
        return flashCardDao.createNewFlashCard(flashCard, userDao.findIdByUsername(principal.getName()));
    }

}
