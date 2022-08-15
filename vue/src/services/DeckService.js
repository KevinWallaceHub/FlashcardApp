import axios from 'axios';

export default{
    getAllDecks() {
        return axios.get('/decks');
    },

    createNewDeck(deck) {
        return axios.post("/decks", deck);
    },

    getFlashCardForDeck(deckId){
        return axios.get(`/decks/${deckId}`);
    },

    addFlashCardToDeck(deckId, flashCard){
        return axios.post(`/decks/${deckId}`,flashCard)
    },

    removeFlashCardFromDeck(deckId, cardId){
        return axios.delete(`/decks/${deckId}/cards/${cardId}`)
    },
}