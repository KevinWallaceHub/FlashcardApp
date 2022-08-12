<template>
  <div>
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
      decks: []
      
    };
  },

created() {
    deckService.getAllDecks()
      .then((response) => {
        this.decks = response.data;
      })
      .catch((error) => console.error(error));
  },

}
</script>

<style>

</style>