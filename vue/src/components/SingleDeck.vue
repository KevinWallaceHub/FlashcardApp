<template>
  <div>
    <div >
    <div @click="setCurrentDeck(),viewFlashCardsInDeck()" class="deckCover">
     {{ deck.name }}
    </div>


    <div >
      <draggable  @start="drag=true" @end="drag=false">
      <flash-card
        
        v-for="currentFlashCard in this.flashCardListForDeck"
        :key="currentFlashCard.card_id"
        :flashcard="currentFlashCard"
      />
      </draggable>
    </div>
</div>
    <div class="deckList"></div>
  </div>
</template>

<script>
import deckService from "@/services/DeckService.js"
import FlashCard from "@/components/FlashCard"
export default {
  data() {
    return {
      decks: [],
      flashCardListForDeck: []
    };
  },

  
  props: ["deck"],
  components: {
      FlashCard
  },

  methods: {

      setCurrentDeck(){
         console.log(this.deck);
          return this.$store.commit('SET_CURRENT_DECK', this.deck)
          
      },
      viewFlashCardsInDeck(){
          const deckId = this.deck.deck_id;
          // console.log(this.$store.state.currentDeck);
           deckService
           .getFlashCardForDeck(deckId)
           .then(response =>{
              console.log(response.data);
              this.flashCardListForDeck =  response.data
              return this.flashCardListForDeck
           }).catch(err => console.error(err))
      }
  }
};
</script>

<style>
.deckCover{
  display: flex;
  justify-content: center;
  align-items: center;
  cursor: pointer;
  height: 22rem;
  width: 7rem;
  font-size: 22pt;
  text-orientation: sideways;
  writing-mode: vertical-lr;
}


</style>