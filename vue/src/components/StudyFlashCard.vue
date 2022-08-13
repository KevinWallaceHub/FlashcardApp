<template>
  <div>
    <div class="sideOne">
      <div class="card">
        <p v-if="this.switchSide" id="question"
          >{{ flashcard.question_side }}
        </p>
        <p v-if="!this.switchSide" id="answer"
          >{{ flashcard.answer_side }}
        </p>
      </div>
    </div>
    <div>
      <button v-on:click="switchTo()">Next</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      switchSide: true,
    };
  },
  props: ["flashcard"],
  methods: {
    switchTo() {
      if (this.switchSide) {
        this.switchSide = false;
      } else {
        this.switchSide = true;
      }
    },
  },
};
</script>

<style>
/* div.sideTwo {
    
} */
</style>