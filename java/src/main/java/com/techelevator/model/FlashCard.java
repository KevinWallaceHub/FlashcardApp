package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.beans.factory.annotation.Required;

import javax.validation.constraints.NotBlank;
import java.util.List;

public class FlashCard {


    /*
    json property to match to our database,
    might not be needed here for now
     */
    @JsonProperty("card_id")
    long cardId;
    @JsonProperty("user_id")
    long userId;
    @JsonProperty("question_side")
    @NotBlank(message = "question side is required")
    String questionSide;
    @JsonProperty("answer_side")
    @NotBlank(message = "answer side is required")
    String answerSide;
    String keywords;



    public long getCardId() {
        return cardId;
    }

    public void setCardId(long cardId) {
        this.cardId = cardId;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getQuestionSide() {
        return questionSide;
    }

    public void setQuestionSide(String questionSide) {
        this.questionSide = questionSide;
    }

    public String getAnswerSide() {
        return answerSide;
    }

    public void setAnswerSide(String answerSide) {
        this.answerSide = answerSide;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    @Override
    public String toString() {
        return "FlashCard{" +
                "cardId=" + cardId +
                ", userId=" + userId +
                ", questionSide='" + questionSide + '\'' +
                ", answerSide='" + answerSide + '\'' +
                ", keywords=" + keywords +
                '}';
    }
}
