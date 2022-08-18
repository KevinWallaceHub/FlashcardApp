<template>
  <div>
    <div>
    <div class="deckName" @click="setCurrentDeck()"> Currently studying deck: "{{ deck.name }}"
    </div>
    <div class="summary"   v-if="showSummary">
    <p >{{this.incorrect}} incorrect responses 
    </p>
    <p>
        {{this.correct}} correct responses
    </p>
    
    </div>


    <div class="shape">
      <test-flash-card
        class="tester"
        :flashcard="this.flashCardListForDeck[this.iterator]"
      />
    </div>
</div>
<div class="testControls">
    <div class="nextCard"> 
        <button v-on:click="iterateFlashCard()">Next</button>
        <button v-on:click="iterateBackFlashCard()">Back</button>
    
    </div>
    <div class="rightOrWrong">
        <button v-on:click="correctAnswer()">Mark Correct</button>
        <button v-on:click="incorrectAnswer()">Mark Incorrect</button>
 <button v-on:click="switchSummary()">Summary</button>
    </div>
    </div>
  </div>
</template>

<script>
import deckService from "@/services/DeckService.js"
import TestFlashCard from "@/components/TestFlashCard"
export default {
  data() {
    return {
        iterator: 0,
      decks: [],
      flashCardListForDeck: [],
     correct:0,
     incorrect:0,
     showSummary:false
    };
  },

  
  props: ["deck"],
  components: {
      TestFlashCard
  },
 created(){
   {
          const deckId = this.deck.deck_id;
          // console.log(this.$store.state.currentDeck);
           deckService
           .getFlashCardForDeck(deckId)
           .then(response =>{
              console.log(response.data);
              this.flashCardListForDeck =  response.data
              return this.flashCardListForDeck
           }).catch(err => console.error(err))
      }
 },
computed:{

},
  methods: {

      setCurrentDeck(){
         console.log(this.deck);
          return this.$store.commit('SET_CURRENT_DECK', this.deck)
      },
    iterateFlashCard(){
      if(this.iterator==this.flashCardListForDeck.length-1){
          return ""
      }else{
        this.iterator=this.iterator+1;
        console.log(this.correct)
      }
    },
    iterateBackFlashCard(){
        if(this.iterator==0){
            return "";
        }else{
        this.iterator=this.iterator-1;
    }
    },

    correctAnswer(){
        this.correct=this.correct+1
        
    },

    incorrectAnswer(){
        this.incorrect=this.incorrect+1
    
    },

        switchSummary() {
      if (this.showSummary) {
        this.showSummary = false;
      } else {
        this.showSummary = true;
      }
    }

}
}
</script>

<style>
.testControls{
    display: flex;
    justify-content: space-evenly;
}

.summary{
    display: flex;
    justify-content: space-evenly;
    font-size: 16pt;
}
</style>