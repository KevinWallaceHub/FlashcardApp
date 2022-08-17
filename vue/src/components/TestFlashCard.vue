<template>
  <div>
    <div class="sideOne">
      <div class="testCard">
        <p v-if="this.switchSide" id="question"
          >{{ flashcard.question_side }}
        </p>
        <p v-if="!this.switchSide" id="answer"
          >{{ flashcard.answer_side }}
        </p>
      </div>
    </div>
    <div>
      <button v-on:click="switchTo()">Flip</button>
       
    </div>
  </div>
</template>


<script>
export default {
  data() {
    return {
    
      decks: [],
      flashCardListForDeck: [],
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
    }
  }
};
</script>

<style>

.testCard{
    height: 400px;
    display: flex;
    align-items: center;
    text-align: center;
   background-color: rgb(247, 241, 234);
  border-style: solid;
  border-color: rgb(4, 65, 65);
  border-width: 1.5px;
  border-radius: 5px;
  font-size: 22pt;
}

#answer {
  
  
  background-color: transparent;
  font-size: 0.9em;

  text-align: center;
    
}
</style>