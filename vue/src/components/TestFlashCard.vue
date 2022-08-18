<template>
  <div>
    <div class="sideOne">
      <div class="testCard">
        <p v-if="this.$store.state.switchSide" id="question"
          >{{ flashcard.question_side }}
        </p>
        <p v-if="!this.$store.state.switchSide" id="answer"
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
      switchSide: false
      
    };
  },
  props: ["flashcard"],
  methods: {
    switchTo() {
      this.$store.commit("SET_SWITCHSIDE", this.switchSide)
      if(this.switchSide){
        this.switchSide = false
      } else ( this.switchSide = true)
      }
    
  }
};
</script>

<style>

.testCard{
    height: 400px;
    display: flex;
    align-items: center;
    text-align:center;
   background-color: rgb(247, 241, 234);
  border-style: solid;
  border-color: rgb(4, 65, 65);
  border-width: 1.5px;
  border-radius: 5px;
  font-size: 24pt;
 width: 100%;
}

#answer {
  
  
  background-color: transparent;
  font-size: 0.9em;
    width: 100%;
  text-align: center;
    
}
#question{
    text-align: center;
    width: 100%;
}
</style>