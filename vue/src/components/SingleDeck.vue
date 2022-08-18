<template>

  <div>
    <div
      id="deleteZone"
      @drop="deleteDrop($event, deck)"
      @dragover.prevent
      @dragenter.prevent
    > Drag Drop & Delete</div>
    <div @drop="onDrop($event, deck)" @dragover.prevent @dragenter.prevent>
      <div class="deckCover">
       <h3> {{ deck.name }}
        </h3>
       
        
      </div>

      <div>
        <flash-card
          draggable="true"
          v-for="currentFlashCard in this.flashCardListForDeck"
          :key="currentFlashCard.card_id"
          :flashcard="currentFlashCard"
        />
        <!-- </draggable> -->
      </div>
    </div>
    <div class="deckList"></div>
  </div>
 
</template>

<script>
import deckService from "@/services/DeckService.js";
import FlashCard from "@/components/FlashCard";
export default {
  data() {
    return {
      decks: [],
      flashCardListForDeck: [],
    };
  },

  props: ["deck"],
  components: {
    FlashCard,
  },
  created() {
    const deckId = this.deck.deck_id;
    // console.log(this.$store.state.currentDeck);
    deckService
      .getFlashCardForDeck(deckId)
      .then((response) => {
        this.flashCardListForDeck = response.data;
        return this.flashCardListForDeck;
      })
      .catch((err) => console.error(err));
    return null;
  },
  methods: {
    setCurrentDeck() {
      console.log(this.deck);

      return this.$store.commit("SET_CURRENT_DECK", this.deck);
    },

    onDrop(evt, dropDeck) {
      let flashcardId = evt.dataTransfer.getData("flashcardId");
      let flashcard = this.$store.state.flashCardList.find(
        (flashcard) => flashcard.card_id == flashcardId
      );
      console.log(dropDeck);
      console.log(flashcard);
      this.flashCardListForDeck.push(flashcard);
      deckService.addFlashCardToDeck(dropDeck.deck_id, flashcard);
    },
    deleteDrop(evt, dropDeck) {
      const flashcardId = evt.dataTransfer.getData("flashcardId");
      const flashcard = this.$store.state.flashCardList.find(
        (flashcard) => flashcard.card_id == flashcardId
      );
      let index = this.flashCardListForDeck.findIndex((card) => {
        return card.card_id == flashcard.card_id;
      });
      this.flashCardListForDeck.splice(index, 1);
      deckService.removeFlashCardFromDeck(dropDeck.deck_id, flashcardId);
    },
  },
};
</script>

<style>
.deckCover {
  /* display: flex; */
  /* flex-direction: column; */
  /* justify-content: flex-start; */
  /* align-items: center; */

  height: 4.5rem;
  width: 9rem;
  font-size: 18pt;
  
  /* text-orientation:sideways;
  writing-mode:vertical-rl */
}

div#deleteZone {
  
  height: 55px;
  background-color: #3d5a80;
  color: #e0fbfc;
  margin-bottom: 5px;
}

</style>