package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Deck {
    /*
       json property to match to our database,
       might not be needed here for now
        */
    @JsonProperty("user_id")
    long userId;

    @JsonProperty("deck_id")
    long deckId;

    String name;

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public long getDeckId() {
        return deckId;
    }

    public void setDeckId(long deckId) {
        this.deckId = deckId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Deck{" +
                "userId=" + userId +
                ", deckId=" + deckId +
                ", name='" + name + '\'' +
                '}';
    }
}
