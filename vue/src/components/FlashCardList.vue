<template>
  <div class="flashCardList">
    <search-flash-card />
    <single-flash-card
      v-if="this.$store.state.showEdit"
      v-bind:flashcard="
        getFlashCardInfoFromCardId(
          this.$store.state.currentCard.card_id,
          this.$store.state.flashCardList
        )
      "
    />
    <button v-if="showButton" v-on:click="createFormToggle()">Create New Card</button>
    <div class="form" v-if="showCreateForm">
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
        v-for="currentFlashCard in searchFunction"
        :key="currentFlashCard.card_id"
        :flashcard="currentFlashCard"
      />
    
  </div>
</template>

<script>
import FlashCard from "@/components/FlashCard.vue";
import flashCardService from "@/services/FlashCardService.js";
import SingleFlashCard from "@/components/SingleFlashCard.vue";
import SearchFlashCard from "@/components/SearchFlashCard.vue";
export default {
  components: {
    FlashCard,
    SingleFlashCard,
    SearchFlashCard,
  },
  props: ['filteredList'],
  data() {
    return {
      questionSide: "",
      answerSide: "",
      keywords: "",
      showCreateForm: false,
      showButton: true
    };
  },

  created() {
    flashCardService
      .getAllFlashCards()
      .then((response) => {
        this.$store.state.flashCardList = response.data;
      })
      .catch((error) => console.error(error));
  },
  computed: {
    searchFunction() {
      const cardList = this.$store.state.flashCardList;
      const searchTerm = this.$store.state.searchTerm;
      return cardList.filter(card => {
        return card.keywords.includes(searchTerm);
      });
    },
    
  },
  methods: {
    createFormToggle() {
      this.showCreateForm = true
      this.showButton = false;
    },
    resetData() {
      this.questionSide = "";
      this.answerSide = "";
      this.keywords = "";
    },
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
          this.$store.state.flashCardList.push(response.data);
          this.resetData();
          this.showButton = true;
          this.showCreateForm = false;
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