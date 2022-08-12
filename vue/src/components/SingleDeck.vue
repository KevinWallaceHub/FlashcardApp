<template>
  <div>
        <div @click="setCurrentDeck()">
         {{ deck.name }}
        </div>
        <div v-if="this.$store.state.currentDeck > 0">
              <flash-card
        v-for="currentFlashCard in this.$store.state.currentDeck"
        :key="currentFlashCard.card_id"
        :flashcard="currentFlashCard"
      />
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

      viewFlashCardsInDeck(deck){
          const deckId = deck.deck_id;
          return deckService.getFlashCardForDeck(deckId)
      }
  },
};
</script>

<style>
</style>