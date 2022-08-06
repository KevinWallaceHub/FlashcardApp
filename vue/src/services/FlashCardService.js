import axios from 'axios';

export default {
    getAllFlashCards() {
        return axios.get('/cards');
    },
}