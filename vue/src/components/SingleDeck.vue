<template>
  <div>
    <div
      id="deleteZone"
      @drop="deleteDrop($event, deck)"
      @dragover.prevent
      @dragenter.prevent
    ></div>
    <div @drop="onDrop($event, deck)" @dragover.prevent @dragenter.prevent>
      <div class="deckCover">
        {{ deck.name }}
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
      const flashcardId = evt.dataTransfer.getData("flashcardId");
      const flashcard = this.$store.state.flashCardList.find(
        (flashcard) => flashcard.card_id == flashcardId
      );
      console.log(dropDeck);
      console.log(flashcard);
      this.flashCardListForDeck.push(flashcard);
      deckService.addFlashCardToDeck(dropDeck.deck_id, flashcard);
      
    },
    deleteDrop(evt, dropDeck) {
      let flashcardId = evt.dataTransfer.getData("flashcardId");
       
      let flashcard = this.$store.state.flashCardList.find(
        (flashcard) => flashcard.card_id == flashcardId
      );
      // console.log(dropDeck);
      // console.log(flashcard);
      deckService
        .removeFlashCardFromDeck(dropDeck.deck_id, flashcardId)
          this.flashCardListForDeck.pop(flashcard);
  
    },
  },
};
</script>

<style>
.deckCover {
  display: flex;
  justify-content: flex-start;
  align-items: center;

  height: 11rem;
  width: 9rem;
  font-size: 18pt;
  border-style: solid;
  /* text-orientation: sideways;
  writing-mode: vertical-lr; */
}

div#deleteZone {
  width: vw;
  height: 25px;
}
</style>