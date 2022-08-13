<template>
  <div id="card"  v-on:click="getCardId(), toggleShowEdit()">
<!--     
      {{ flashcard.user_id}}
      {{flashcard.keywords}}
      {{flashcard.card_id}}
       -->
      <div class="sideOne">
          <div class="front" >
              <span  id="question">{{flashcard.question_side}}</span>
          </div>
          <div class= "back">
                <span  id="answer">{{flashcard.answer_side}} </span>
      </div>
      </div>

  </div>
</template>

<script>

export default {
    data(){
        return {
            currentCard:{}
        }
    },
    computed: {
        
    },
    methods: {
           toggleShowEdit(){
      this.$store.commit('SET_SHOW_EDIT', true)
    },
        
        getCardId(){
            this.currentCard = this.flashcard
            this.$store.commit('SET_CURRENT_CARD', this.currentCard);
            // console.log(this.$store.state.currentCard);
        }
    },
    
    props: ['flashcard'],
}
</script>

<style>
div#card  {
    display: flex;
    /* border: 2px;
    border-style:solid; */
    margin: 10px;
    justify-content:space-evenly;
    flex-direction: row;
    width:300px;
    perspective: 1000px; 
    background-color:transparent;
    font-size: .9em;
    height: 300px;
    text-align: center;
    
}
     div.sideOne{
        position: relative;
        transition:transform .9s;
        transform-style: preserve-3d;
        box-shadow: 2px 4px 8px 0 #E47B64;
        width:100%;
        
        justify-content: center;
        
    } 

     div#card:hover .sideOne{
        transform: rotateY(180deg);
       
    }

    .front, .back{
        
        -webkit-backface-visibility: hidden;
        backface-visibility: hidden;
        
    }
    .front{
        font-size: 1.5em;
        position: relative;
        top: 25%;

    }
    .sideOne{
        background-color:rgb(247, 241, 234);
        border-style:solid;
        border-color: rgb(4, 65, 65);
        border-width: 1.5px;
        border-radius: 5px;
            }
    
    .back{
    transform: rotateY(180deg);
    /* this bit here makes the answer side of the card fit 
    but for short cards the answer is down at the bottom... not ideal  */
    position:absolute;
       top: 1%;
        
        
    } 
    
    span#question {
    border-width: 0px 0px 2px 0px;
    border-style:solid;
}

p#answer{
    border-width: 0px 0px 2px 0px;
    border-style:solid;
  
}


</style>