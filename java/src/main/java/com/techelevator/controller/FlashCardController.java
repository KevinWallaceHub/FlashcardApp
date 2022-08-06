package com.techelevator.controller;

import com.techelevator.dao.FlashCardDao;
import com.techelevator.model.FlashCard;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
public class FlashCardController {

    private FlashCardDao flashCardDao;
    
    public FlashCardController(FlashCardDao flashCardDao) {
        this.flashCardDao = flashCardDao;
    }


    @RequestMapping(path = "/cards", method = RequestMethod.GET)
    public List<FlashCard> showAllCards() {
        return flashCardDao.findAllCards();
    }
}
