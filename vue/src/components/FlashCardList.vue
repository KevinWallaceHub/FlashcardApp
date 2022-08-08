<template>
  <div class="flashCardList">
      <div class="form">
          <form action="submit">
              <label for="questionSide">Question:</label>
              <input type="text" id="questionSide" v-model="questionSide">
              <label for="answerSide">Answer:</label>
              <input type="text" id="answerSide" v-model="answerSide">
              <label for="keywords">Keywords:</label>
              <input type="text" id="keywords" v-model="keywords">
              <button class="submit" v-on:click.prevent="createNewFlashCard()">Submit</button>
          </form>
      </div>
    <flash-card 
     v-for="currentFlashCard in flashCardList"
     :key="currentFlashCard.card_id"
     :flashcard="currentFlashCard"/>
  </div>
</template>

<script>
import FlashCard from "@/components/FlashCard.vue";
import flashCardService from "@/services/FlashCardService.js";

export default {
  components: {
    FlashCard,
  },
  data() {
    return {
      flashCardList: [],
      questionSide: "",
      answerSide: "",
      keywords: ""
    };
  },
  created() {
    flashCardService
      .getAllFlashCards()
      .then((response) => {
        this.flashCardList = response.data;
        console.log(this.flashCardList);
      })
      .catch((error) => console.error(error));
  },
  methods: {
        createNewFlashCard() {
            const newFlashCard = {
                question_side: this.questionSide,
                answer_side: this.answerSide,
                keywords: this.keywords
            }
            flashCardService.createNewFlashCard(newFlashCard).then( response => {
                this.flashCardList.push(response.data);
            }).catch( err => console.error(err));
        }
    }
};
</script>

<style>
div.flashCardList{
    display: flex;
    flex-direction: row;
    justify-items: center;
    flex-wrap: wrap;
    justify-content: space-evenly;
    
}

</style>