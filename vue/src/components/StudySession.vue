<template>
  <div>
    <div class="mainSelection">
      <h2 v-if="!this.sessionActive">Welcome to the study room</h2>
          <form action="submit" v-if="!this.sessionActive">
            <label for="Decks">Please Select a deck to study from</label>
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
          </div>
          <div class="stopSession"
          v-if="this.sessionActive">
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
div .mainSelection{
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-right:30px;
}

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
  margin-left: 2rem;
  
  font-size: 11pt;
}
button:hover {
  background-color: #d44623;
  transition: 0.7s;
}
select {
  border-radius: 5px;
  color: #ffffff;
 
  margin: 10px;
  
  cursor: pointer;
  font-weight: bold;
  text-align: center;
  text-transform: uppercase;
  border-style: solid;
  background-color:#ee6c4d ;
  padding: 8px;
}
div.sideOne {
  margin: 10px;
  
}
.stopSession{
  display: flex;
  

  
}
</style>