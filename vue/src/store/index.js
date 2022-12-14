import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));

if(currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {},
    currentCard: {},
    currentDeck: {},
    updatedFlashCard:{},
    flashCardList: [],
    searchTerm: "",
    showEdit: false,
    deckList:[],
    switchSide:true
  },
  mutations: {
    SET_SWITCHSIDE(state, bool){
      if(bool){
        state.switchSide = false;
      } if(!bool){
        state.switchSide =true;
      }
    },

    SET_SHOW_EDIT(state, bool){
      if(bool){
        state.showEdit = true;
      } else {state.showEdit = false;}
    },

    SET_SEARCH_TERM(state, string) {
      state.searchTerm = string;
    },
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    },
    SET_CURRENT_CARD(state, flashCard) { 
      state.currentCard = flashCard;
    },
    SET_CURRENT_DECK(state,deck){
      state.currentDeck = deck;
    },

    SET_UPDATED_CARD(state, flashCard){
      state.updatedFlashCard=flashCard;
    },
  
  },
  // actions: {
  //   getCardId(){
  //     console.log(this.currentCardId)
  //     return this.currentCard.card_id;
  // }
  // }
})
