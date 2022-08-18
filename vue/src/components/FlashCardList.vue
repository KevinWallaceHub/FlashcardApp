<template>
  <div class="page">
    <div class="twoButtons">
      <div class="searchBarFlashCardpage"><search-flash-card /></div>

      <div>
        <single-flash-card
          class="formToEdit"
          v-if="this.$store.state.showEdit"
          v-bind:flashcard="
            getFlashCardInfoFromCardId(
              this.$store.state.currentCard.card_id,
              this.$store.state.flashCardList
            )
          "
        />
      </div>
      <div>
        <button
          v-if="showButton"
          class="createButton"
          v-on:click="createFormToggle()"
        >
          Create New Card
        </button>
      </div>
    </div>

    <div class="createForm" v-if="showCreateForm">
      <form class="form" action="submit">
        <label for="questionSide">Question:</label>
        <textarea type="textarea" rows="3"
            cols="100" id="questionSide" v-model="questionSide" />
        <label for="answerSide"> Answer:</label>
        <textarea type="text" id="answerSide" v-model="answerSide" />
        <label for="keywords"> Keywords:</label>
        <textarea type="text" id="keywords" v-model="keywords" />
        <div>
        <button class="submit" v-on:click.prevent="createNewFlashCard()">
          Submit
        </button>
        <button class="submit" v-on:click="cancelCreate()">Cancel</button>
        </div>
      </form>
    </div>
    <div class="flashCardList">
      <flash-card
        v-for="currentFlashCard in searchFunction"
        :key="currentFlashCard.card_id"
        :flashcard="currentFlashCard"
      />
    </div>
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
  props: ["filteredList"],
  data() {
    return {
      questionSide: "",
      answerSide: "",
      keywords: "",
      showCreateForm: false,
      showButton: true,
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
      const searchTerm = this.$store.state.searchTerm.toLowerCase();
      return cardList.filter((card) => {
        return card.keywords.toLowerCase().includes(searchTerm);
      });
    },
  },
  methods: {
    createFormToggle() {
      this.showCreateForm = true;
      this.showButton = false;
    },
    cancelCreate(){
      this.showCreateForm = false;
      this.showButton = true;
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
div.twoButtons {
  display: flex;
  justify-content: center;
  flex-direction: column-reverse;
  align-items: center;
}
div.flashCardList {
  display: flex;
  flex-direction: row;
  justify-items: center;
  flex-wrap: wrap;
  justify-content: space-evenly;
}

div.createForm {
  border-style: solid;
  border-width: 2px;
  background-color: #98C1D9;
  display: flex;
  flex-direction: row;
  align-items: center;
  word-wrap: none;
  width: 70%;
  justify-content: space-evenly;
  box-shadow: 2px 4px 7px 0 #e47b64;
  margin: auto;
  padding: 5px;
  border-radius: 5px;
  z-index: 1;
  
}
form.form {
  font-family: "Courier New", Courier, monospace;
  font-weight: bold;
  text-align: center;
  text-transform: uppercase;
  display: flex;
  flex-direction: column;
  justify-content: center;
  position: relative;
}
button.createButton {
  width: 9.7rem;
  padding: 10px;
  border-radius: 5px;
  color: #ffffff;
  background-color: #ee6c4d;
  font-weight: bold;
  text-align: center;
  text-transform: uppercase;
  cursor: pointer;
}
button.createButton:hover {
  background-color: #d44623;
  transition: 0.7s;
}
button.submit {
  margin: 5px;
  width: 9.7rem;
  padding: 10px;
  border-radius: 5px;
  color: #ffffff;
  background-color: #ee6c4d;
  font-weight: bold;
  text-align: center;
  text-transform: uppercase;
  cursor: pointer;
}
button.submit:hover {
  border-color: #215350;
  background-color: #d44623;
  transition: 0.7s;
}

</style>