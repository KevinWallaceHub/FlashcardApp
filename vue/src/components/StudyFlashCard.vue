<template>
  <div>
    <div class="theCard">
        <!-- class="sideOne" -->
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
      switchSide: false,
    };
  },
  props: ["flashcard"],
  methods: {
    switchTo() {
      this.$store.commit("SET_SWITCHSIDE", this.switchSide)
         if(this.switchSide){
        this.switchSide = false
      } else ( this.switchSide = true)
      
  },
  }
};
</script>

<style>
.theCard{
    width: 100%;;
}
.testCard{
    width:100%;
   display: flex;
   padding:5px;
}
#answer {
  
  
  background-color: transparent;
  font-size: .9em;

  text-align: center;
    
}
</style>