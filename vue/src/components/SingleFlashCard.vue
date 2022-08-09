<template>
  <div class="singleCard" v-if="this.$store.state.showEdit">
    <form action="submit">
      <!-- <p>Username: {{ flashcard.user_id }}</p>
      <p>Card ID{{ flashcard.card_id }}</p> -->
      <label for="questionSide">Question: {{ flashcard.question_side }}</label>
      <input type="text" id="questionSide" v-model="questionSide" />
      <label for="answerSide">Answer: {{ flashcard.answer_side }}</label>
      <input type="text" id="answerSide" v-model="answerSide" />
      <label for="keywords">Keywords: {{ flashcard.keywords }}</label>
      <input type="text" id="keywords" v-model="keywords" />
      <button class="submit" @click.prevent="updateSelectedFlashcard(),toggleShowEdit()">
        Update
      </button>
      <button class="cancel" v-on:click.prevent="toggleShowEdit()">Cancel</button>
    </form>
  </div>
</template>

<script>
import flashCardService from "@/services/FlashCardService.js";

export default {
  data() {
    return {
      
      questionSide: "",
      answerSide: "",
      keywords: "",
    };
  },
  props: ["flashcard"],
  computed: {
  },
  methods: {
    toggleShowEdit(){
      this.$store.commit('SET_SHOW_EDIT', false)
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
</style>