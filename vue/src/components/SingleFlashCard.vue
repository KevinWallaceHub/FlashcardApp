<template>
  <div class="singleCard">
    <form action="submit">
      <p>Username: {{ flashcard.user_id }}</p>
      <p>Card ID{{ flashcard.card_id }}</p>
      <label for="questionSide">Question: {{ flashcard.question_side }}</label>
      <input type="text" id="questionSide" v-model="questionSide" />
      <label for="answerSide">Answer: {{ flashcard.answer_side }}</label>
      <input type="text" id="answerSide" v-model="answerSide" />
      <label for="keywords">Keywords: {{ flashcard.keywords }}</label>
      <input type="text" id="keywords" v-model="keywords" />
      <button class="submit" v-on:click.prevent="updateFlashCard()">
          Update
        </button>
    </form>
  </div>
</template>

<script>
import flashCardService from "@/services/FlashCardService.js";
export default {
  data() {
    return {};
  },
  props: ["flashcard"],
  computed: {},
  methods:{
      updateSelectedFlashcard(){
          const flashcard = {
              card_id: this.flashcard.card_id,
              question_side: this.flashcard.question_side,
              answer_side: this.flashcard.answer_side,
              keywords: this.keywords,
              user_id: this.$store.state.user.id
          }; flashCardService.updateFlashCard(flashcard.card_id, flashcard).then(response => {
              if(response.status ===200){
                  alert("updated success")}
          }).catch(err => {console.error(err)})

      }
  },
};
</script>

<style>
</style>