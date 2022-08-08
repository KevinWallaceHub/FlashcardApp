<template>
  <div class="flashCardList">
    <single-flash-card
      v-if="this.$store.state.currentCard.card_id != 0"
      v-bind:flashcard="
        getFlashCardInfoFromCardId(
          this.$store.state.currentCard.card_id,
          flashCardList
        )
      "
    />
    <div class="form" v-show="!this.$store.state.currentCard.card_id > 0">
      <form action="submit">
        <label for="questionSide">Question:</label>
        <input type="text" id="questionSide" v-model="questionSide" />
        <label for="answerSide">Answer:</label>
        <input type="text" id="answerSide" v-model="answerSide" />
        <label for="keywords">Keywords:</label>
        <input type="text" id="keywords" v-model="keywords" />
        <button class="submit" v-on:click.prevent="createNewFlashCard()">
          Submit
        </button>
      </form>
    </div>
    <flash-card
      v-for="currentFlashCard in flashCardList"
      :key="currentFlashCard.card_id"
      :flashcard="currentFlashCard"
    />
  </div>
</template>

<script>
import FlashCard from "@/components/FlashCard.vue";
import flashCardService from "@/services/FlashCardService.js";
import SingleFlashCard from "@/components/SingleFlashCard.vue";
export default {
  components: {
    FlashCard,
    SingleFlashCard,
  },
  data() {
    return {
      flashCardList: [],
      questionSide: "",
      answerSide: "",
      keywords: "",
    };
  },

  created() {
    flashCardService
      .getAllFlashCards()
      .then((response) => {
        this.flashCardList = response.data;
      })
      .catch((error) => console.error(error));
  },
  methods: {
    createNewFlashCard() {
      const newFlashCard = {
        question_side: this.questionSide,
        answer_side: this.answerSide,
        keywords: this.keywords,
        user_id: this.$store.state.user.id,
      };
      console.log(newFlashCard);
      flashCardService
        .createNewFlashCard(newFlashCard)
        .then((response) => {
          console.log(response);
          this.flashCardList.push(response.data);
        })
        .catch((err) => console.error(err));
    },

    getFlashCardInfoFromCardId(cardId, flashCardList) {
      if (cardId) {
        for (let i = 0; i < flashCardList.length; i++) {
          if (flashCardList[i].card_id === cardId) {
            return flashCardList[i];
          }
        }
      }
      return "Flashcard not selected";
    },
  },
};
</script>

<style>
div.flashCardList {
  display: flex;
  flex-direction: row;
  justify-items: center;
  flex-wrap: wrap;
  justify-content: space-evenly;
}
</style>