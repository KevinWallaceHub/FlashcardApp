import axios from 'axios';

export default{
    getAllDecks() {
        return axios.get('/decks');
    },

    createNewDeck(deck) {
        return axios.post("/decks", deck);
    },
}