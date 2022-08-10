<template>
  <div class="page">
   <div class="twoButtons">
    <div class="searchBar"><search-flash-card /></div>
    
    <div><single-flash-card class="formToEdit"
      v-if="this.$store.state.showEdit"
      v-bind:flashcard="
        getFlashCardInfoFromCardId(
          this.$store.state.currentCard.card_id,
          this.$store.state.flashCardList
        )
      "
    /></div>
    <div> <button v-if="showButton" class="createButton" v-on:click="createFormToggle()">Create New Card</button></div>
   </div>
    
    <div class="createForm" v-if="showCreateForm">
      <form class="form" action="submit">
        <label for="questionSide">Question:</label>
        <input type="text" id="questionSide" v-model="questionSide" />
        <label for="answerSide"> Answer:</label>
        <input type="text" id="answerSide" v-model="answerSide" />
        <label for="keywords"> Keywords:</label>
        <input type="text" id="keywords" v-model="keywords" />
        <button class="submit" v-on:click.prevent="createNewFlashCard()">
          Submit
        </button>
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
      const searchTerm = this.$store.state.searchTerm.toLowerCase();
      return cardList.filter(card => {
        return card.keywords.toLowerCase().includes(searchTerm);
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
div.twoButtons{
  display: flex;
  justify-content: center;
  margin-left: 59px; 
   
}
div.flashCardList {
  display: flex;
  flex-direction: row;
  justify-items: center;
  flex-wrap: wrap;
  justify-content: space-evenly;
}

div.createForm{
  display: flex;
  justify-content: center;
  
}
form.form{
  font-family:'Courier New', Courier, monospace;
  font-weight: bold;
  text-align: center;
  text-transform: uppercase;
  border-style: inset;
  
}
button.createButton{
  margin:5px;
    width: 9.7rem;
  padding: 10px;
  border-radius: 5px;
  color: #ffffff;
  background-color: #fdb89c;
  font-weight: bold;
  text-align: center;
  text-transform: uppercase;
  cursor: pointer;

}
button.createButton:hover{
background-color: #e47b64;
  transition: 0.7s;
}
 button.submit{ 
    margin:5px;
    width: 9.7rem;
  padding: 10px;
  border-radius: 5px;
  color: #ffffff;
  background-color: #fdb89c;
  font-weight: bold;
  text-align: center;
  text-transform: uppercase;
  cursor: pointer;
} 
button.submit:hover{
  border-color:#215350;
  background-color: #e47b64;
  transition: 0.7s;
}
</style>