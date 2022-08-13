<template>
  <div>
      <div class="sideOne">
         

 
    

          <div class="front" v-if="this.switchSide">
              <p  id="question">{{flashcard.question_side}}</p>
          </div>
          <div class= "back" v-if="!this.switchSide">
                <p  id="answer">{{flashcard.answer_side}} </p>
            </div>
      </div>
      <div>
          <button v-on:click="switchTo"> Next</button>
      </div>
  </div>
</template>

<script>
export default {
    data(){
        return{
            switchSide: true,
        }
    },
    props: ['flashcard'],
    methods: {
        switchTo(){
            if(this.switchSide){
                this.switchSide = false;
            } else { this.switchSide = true;}
        },
    },

}
</script>

<style>

</style>