<template>
  <div class="singleCard" v-if="this.$store.state.showEdit">
    <form action="submit">
      <!-- <p>Username: {{ flashcard.user_id }}</p>
      <p>Card ID{{ flashcard.card_id }}</p> -->
      <div id="questionSide">
        <label for="questionSide"
          >Question: </label
        >
        <textarea rows="3" cols="100" type="textbox" id="questionSide" v-model="questionSide" />
      </div>
      <div id="answerSide">
        <label for="answerSide">Answer: </label>
        <textarea rows="6" type="text" id="answerSide" v-model="answerSide" />
      </div>
      <div id="keywords">
        <label for="keywords">Keywords: </label>
        <input type="text" id="keywords" v-model="keywords" />
      </div>
      <div>
        <button
          class="submit"
          @click.prevent="updateSelectedFlashcard(), toggleShowEdit()"
        >
          Update
        </button>
        <button class="cancel" v-on:click.prevent="toggleShowEdit()">
          Cancel
        </button>
      </div>
    </form>
  </div>
</template>

<script>
import flashCardService from "@/services/FlashCardService.js";

export default {
  data() {
    return {
      questionSide: this.flashcard.question_side,
      answerSide: this.flashcard.answer_side,
      keywords: this.flashcard.keywords,
    };
  },
  props: ["flashcard"],
  computed: {},
  methods: {
    toggleShowEdit() {
      this.$store.commit("SET_SHOW_EDIT", false);
    },
    resetData() {
      this.questionSide = "";
      this.answerSide = "";
      this.keywords = "";
    },
    updateSelectedFlashcard() {
      const updatedFlashcard = {
        card_id: this.flashcard.card_id,
        question_side: this.questionSide,
        answer_side: this.answerSide,
        keywords: this.keywords,
        user_id: this.$store.state.user.id,
      };
      flashCardService
        .updateFlashCard(updatedFlashcard.card_id, updatedFlashcard)
        .then((response) => {
          if (response.status === 200) {
            // console.log(response);
            this.$store.state.flashCardList.push(updatedFlashcard);
            let index = this.$store.state.flashCardList.indexOf(this.flashcard);
            if (index !== -1) {
              this.$store.state.flashCardList.splice(index, 1);
            }
            alert("updated success");
            this.resetData();
          }
        })
        .catch((err) => {
          console.error(err);
        });
    },
  },
};
</script>

<style>
div.singleCard {
  color:rgb(4,65,65);
  border-style: solid;
  background-color: white;
  display: flex;
  word-wrap: none;
  flex-direction: row;
  justify-content: space-around;
}
div#questionSide, div#answerSide, div#keywords{
  display: flex;
  flex-direction: column;
  margin: 5px;
  
}
</style>