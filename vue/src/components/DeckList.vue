<template>
  <div>
    <div class="createForm">
      <form action="submit" class="form">
      <label for="name">Deck Name:</label>
      <input type="text" id="newDeckName" v-model="name" required >
      <button type="submit" class="submit" v-on:click.prevent="createNewDeck()">Create Deck</button>
    </form>
    </div>
    
     <div class="flashCardList">
      <single-deck 
            v-for="currentDeck in decks"
            v-bind:key="currentDeck.deck_id"
            v-bind:deck="currentDeck"
             />
       </div>
  </div>
</template>

<script>
import SingleDeck from '@/components/SingleDeck';
import deckService from "@/services/DeckService.js";

export default {

components: {
SingleDeck,
},
data() {
    return {
      name: "",
      decks: [],
      newDeck: {}
      
    };
  },

created() {
    deckService.getAllDecks()
      .then((response) => {
        this.decks = response.data;
      })
      .catch((error) => console.error(error));
  },

methods: {
  createNewDeck(){
    if(this.name.length > 0){
    const deck = {
      name: this.name,
      user_id: this.$store.state.user.id
    }
    console.log(deck)
    deckService
    .createNewDeck(deck).then(response =>{
      console.log(response.data);
      this.decks.push(response.data)
    }).catch(err => console.error(err))
  } else { alert("Name is a required field")}

  }
},

}
</script>

<style>

</style>