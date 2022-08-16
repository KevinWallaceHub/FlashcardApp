<template>
  <div>
    <div >
    <div class="deckName" @click="setCurrentDeck()"> Currently studying deck: "{{ deck.name }}"
    </div>


    <div class="shape">
      <study-flash-card
        class="tester"
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
 created(){
   {
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
 },
  methods: {

      setCurrentDeck(){
         console.log(this.deck);
          return this.$store.commit('SET_CURRENT_DECK', this.deck)
          
      },
      // viewFlashCardsInDeck(){
      //     const deckId = this.deck.deck_id;
      //     // console.log(this.$store.state.currentDeck);
      //      deckService
      //      .getFlashCardForDeck(deckId)
      //      .then(response =>{
      //         console.log(response.data);
      //         this.flashCardListForDeck =  response.data
      //         return this.flashCardListForDeck
      //      }).catch(err => console.error(err))
      // }
  }
};
</script>

<style>
.tester{
  padding: 30px;
  width:350px;
  
}
.shape{
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  border-style:ridge;
  border-width: 1px;
  margin-left: 2px;
  
}

.deckName{
  margin:10px;
  margin-left: 3rem;
  width: 15rem;
  padding: 10px;
  border-radius: 5px;
  border-color: black;
  border-style: solid;
  border-width: 2px;
  color: #ffffff;
  background-color: #ee6c4d;
  font-weight: bold;
  text-align: center;
  text-transform: uppercase;
  font-size: 10pt;
}
</style>