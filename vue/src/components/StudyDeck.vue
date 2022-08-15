<template>
  <div>
    <div >
    <div @click="setCurrentDeck(),viewFlashCardsInDeck()">
     {{ deck.name }}
    </div>


    <div >
      <study-flash-card
        
        v-for="currentFlashCard in this.flashCardListForDeck"
        :key="currentFlashCard.card_id"
        :flashcard="currentFlashCard"
      />
    </div>
</div>
    <div class="deckList"></div>
  </div>
</template>

<script>
import deckService from "@/services/DeckService.js"
import StudyFlashCard from "@/components/StudyFlashCard"
export default {
  data() {
    return {
      decks: [],
      flashCardListForDeck: []
    };
  },

  
  props: ["deck"],
  components: {
      StudyFlashCard
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

</style>