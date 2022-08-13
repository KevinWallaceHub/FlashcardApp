<template>
  <div>
    <div class="createForm">
      <form action="submit" class="form">
      <label for="name">Deck Name:</label>
      <input type="text" id="newDeckName" v-model="name" required >
      <button type="submit" class="submit" v-on:click.prevent="createNewDeck(),logFlashcardList()">Create Deck</button>
    </form>
    </div>
    <div class="flashCardList">
      <search-flash-card/>
      <flash-card
     
        v-for="currentFlashCard in searchFunctionForDeckList"
        :key="currentFlashCard.card_id"
        :flashcard="currentFlashCard"
      />
    </div>
    
    <div class="accContainer">
     <div class="flashCardListacc" > 
     <div   v-bind:class="[isActive ? 'flashCardListHover' : 'flashCardListacc']" @click="toggleClass()">
        
      <single-deck 
         
            v-for="currentDeck in decks"
            v-bind:key="currentDeck.deck_id"
            v-bind:deck="currentDeck"
             />
       </div>
       </div>
       </div>
       
  </div>
</template>

<script>
import SingleDeck from '@/components/SingleDeck';
import deckService from "@/services/DeckService.js";
import SearchFlashCard from '@/components/SearchFlashCard.vue';
import flashCardService from '@/services/FlashCardService.js';
export default {

components: {
SingleDeck,
SearchFlashCard
},
data() {
    return {
      name: "",
      decks: [],
      newDeck: {},
      isActive: true
    };
  },

created() {
    deckService.getAllDecks()
      .then((response) => {
        this.decks = response.data;
      })
      .catch((error) => console.error(error));

       flashCardService
      .getAllFlashCards()
      .then((response) => {
        this.$store.state.flashCardList = response.data;
      })
      .catch((error) => console.error(error));
  },
    computed: {
    searchFunctionForDeckList() {
      const cardList = this.$store.state.flashCardList;
      const searchTerm = this.$store.state.searchTerm.toLowerCase();
      return cardList.filter(card => {
        return card.keywords.toLowerCase().includes(searchTerm);
      });
   
    
    
  }
},
methods: {
  logFlashcardList(){
    console.log(this.$store.state.flashCardList);
  },
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
.accContainer{
margin: 30px auto;
  width:100%;
  display: flex;
  justify-content: center;
  
 
}

.flashCardListHover{
  display: flex;
  flex-wrap:nowrap;
  overflow:hidden;
  width:65%;
  height:550px;
   box-shadow: 3px 3px 4px 0px black;
}

.flashCardListHover >div {
  width:40%;
  flex-grow:1;
  flex-shrink:1;
  
  overflow-y:scroll;
  transition:all .5s ease;
  border:5px solid aliceblue;
  border-radius:10px;
  
  position:relative;
  scroll-behavior: smooth;
}

 .flashCardListHover >div::-webkit-scrollbar {
  display: none; }

.flashCardListacc{
  display: flex;
  flex-wrap:nowrap;
  overflow:hidden;
  width:95%;
  height:550px;
   box-shadow: 3px 3px 4px 0px black;
}

.flashCardListacc >div {
  width:80%;
  flex-grow:1;
  flex-shrink:0;
  overflow-y:scroll;
  transition:all .5s ease;
  border:5px solid aliceblue;
  border-radius:10px;
  
  position:relative;
  scroll-behavior: smooth;
}

.flashCardListHover> div:hover{
   
  flex-shrink: 0;
 }
/* .flashCardListacc >div:hover{
  flex-shrink: 0;
  
} */
div.flashCardList {
  display: flex;
  flex-direction: row;
  justify-items: center;
  flex-wrap: wrap;
  justify-content: space-evenly;
  
}



 
</style>