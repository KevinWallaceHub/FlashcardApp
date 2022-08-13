<template>
  <div>
    <div class="createForm">
      <form action="submit" class="form">
      <label for="name">Deck Name:</label>
      <input type="text" id="newDeckName" v-model="name">
      <button type="submit" class="submit" v-on:click.prevent="createNewDeck()">Create Deck</button>
    </form>
    </div>
    <div class="accContainer">
     <div class="flashCardListacc">
      <single-deck 
            v-for="currentDeck in decks"
            v-bind:key="currentDeck.deck_id"
            v-bind:deck="currentDeck"
             />
       </div>
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
  },

},

}
</script>

<style>
.accContainer{
margin: 30px auto;
  width:100%;
  display: flex;
  justify-content: center;
  align-items: center;
 
}

.flashCardListacc{
  display: flex;
  flex-wrap:nowrap;
  overflow:hidden;
  width:65%;
  height:550px;
   box-shadow: 3px 3px 4px 0px black;
}

.flashCardListacc >div {
  width:80%;
  flex-grow:1;
  flex-shrink:10;
  overflow-y:scroll;
  transition:all .5s ease;
  border:5px solid aliceblue;
  border-radius:10px;
  
  position:relative;
  scroll-behavior: smooth;
}
.flashCardListacc >div:hover{
  flex-shrink: 0;
}

</style>