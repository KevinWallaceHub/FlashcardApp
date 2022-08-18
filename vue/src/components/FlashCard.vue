<template>
  <div
    id="card"
    v-on:click="getCardId(), toggleShowEdit()"
    draggable="true"
    @dragstart="dragStart($event, flashcard)"
  >
    <div class="sideOne">
      <div class="front">
        <span id="question">{{ flashcard.question_side }}</span>
      </div>
      <div class="back">
        <span id="answer">{{ flashcard.answer_side }} </span>
        <img id="answerImage" :src="getImageUrl" alt="" />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      currentCard: {},
      image: "",
    };
  },
  computed: {
    getImageUrl() {
      console.log(this.flashcard);
      return this.flashcard.image_url;
    },
  },
  methods: {
    toggleShowEdit() {
      this.$store.commit("SET_SHOW_EDIT", true);
    },

    dragStart(evt, flashcard) {
      flashcard = this.flashcard;
      evt.dataTransfer.dropEffect = "move";
      evt.dataTransfer.effectAllowed = "move";
      evt.dataTransfer.setData("flashcardId", flashcard.card_id);
    },
    getCardId() {
      this.currentCard = this.flashcard;
      this.$store.commit("SET_CURRENT_CARD", this.currentCard);
    },
  },

  props: ["flashcard"],
};
</script>

<style>
div#card {
  display: flex;
  margin: 10px;
  justify-content: space-evenly;
  flex-direction: row;
  width: 300px;
  perspective: 1000px;
  background-color: transparent;
  font-size: 0.9em;
  height: 300px;
  text-align: center;
}
div.sideOne {
  display: flex;
  flex-direction: column;
  align-items: center;
  position: relative;
  transition: transform 0.9s;
  transform-style: preserve-3d;
  box-shadow: 2px 4px 8px 0 #e47b64;
  width: 100%;
  color: #293241;
  justify-content: center;
}

div#card:hover .sideOne {
  transform: rotateY(180deg);
}

.front,
.back {
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  margin: 10px;
}
.front {
  font-size: 2em;
  position: relative;
}
.sideOne {
  background-color: rgb(247, 241, 234);
  border-radius: 5px;
}

.back {
  transform: rotateY(180deg);
  position: absolute;
  font-size: 10pt;
}
img#answerImage {
  display: flex;
  max-width: 10em;
  max-height: auto;
  justify-content: space-around;
  align-items: center;
}
</style>