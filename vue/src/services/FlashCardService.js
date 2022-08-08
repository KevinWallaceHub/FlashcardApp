import axios from 'axios';

export default {
    getAllFlashCards() {
        return axios.get('/cards');
    },

    createNewFlashCard(flashCard) {
        return axios.post("/cards", flashCard);
    }
}