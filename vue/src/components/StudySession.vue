<template>
  <div>
      <h2 v-if="!this.sessionActive">Welcome to the study room</h2>
          <form action="submit" v-if="!this.sessionActive">
            <label for="Decks">Please Select A deck to study from</label>
            <select  name="Decks" id="Decks" v-model="selectedDeck">
            <option></option>
            <option v-for="deck in this.decks"
            :key="deck.deck_id"
            :value="deck"
            >{{deck.name}}
                   </option>
            </select>
            <button v-on:click.prevent="setActiveSession()">Start Studying!</button>
          </form>
          <div v-if="this.sessionActive">
              <button v-on:click="setActiveSession()">Stop Session</button>
              <study-deck 
              v-bind:deck="selectedDeck"/>
          </div>
  </div>
</template>

<script>
import deckService from "@/services/DeckService.js";
import StudyDeck from './StudyDeck.vue';
export default {
  components: { StudyDeck },
    data(){
        return {
        selectedDeck: {},
        decks: [],
        sessionActive: false
        }
    },

created() {
    deckService.getAllDecks()
      .then((response) => {
        this.decks = response.data;
      })
      .catch((error) => console.error(error));
  },
methods: {
    setActiveSession(){
        console.log(this.selectedDeck);
        if(!this.sessionActive){
            this.sessionActive = true;
            this.decks
        } else {this.sessionActive = false}
    },
}
}
</script>

<style>
button {
  width: 9.7rem;
  padding: 10px;
  border-radius: 5px;
  color: #ffffff;
  background-color: #ee6c4d;
  font-weight: bold;
  text-align: center;
  text-transform: uppercase;
  cursor: pointer;
  margin-left: 10px;
  margin-bottom: 10px;
}
button:hover {
  background-color: #d44623;
  transition: 0.7s;
}
select {
  margin: 10px;
  cursor: pointer;
}
div.sideOne {
  margin: 15px;
  width: auto;
}
</style>