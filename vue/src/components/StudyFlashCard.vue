<template>
  <div>
      <div class="sideOne">
          <div class="front" v-if="this.switchSide">
              <span  id="question">{{flashcard.question_side}}</span>
          </div>
          <div class="back" v-if="!this.switchSide">
                <span  id="answer">{{flashcard.answer_side}} </span>
            </div>
      </div>
      <div>
          <button v-on:click="switchTo()"> Next</button>
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