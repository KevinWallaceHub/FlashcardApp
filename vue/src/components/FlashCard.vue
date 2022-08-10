<template>
  <div id="card">
<!--     
      {{ flashcard.user_id}}
      {{flashcard.keywords}}
      {{flashcard.card_id}}
       -->
      <div class="sideOne">
          <div class="front">
              <p  id="question">{{flashcard.question_side}}</p>
          </div>
          <div class= "back">
      <p id="answer">{{flashcard.answer_side}} </p>
      </div>
      </div>
<!-- v-if="!display" v-on:click="display=true"
 v-on:click="display=false" v-show="display"   -->
  </div>
</template>

<script>

export default {
    date(){
        return {
            display: false,
        }
    },
    props: ['flashcard']
    ,
    computed: {

    },
}
</script>

<style>
div#card  {
    display: flex;
    /* border: 2px;
    border-style:solid; */
    margin: 10px;
    text-align: center;
    justify-content: center;
    flex-direction: row;
    width:25%;
    /* everything between line 48 and 79 is relating to the card flip animation*/
    perspective: 1000px; 
    background-color:transparent;
    font-size: 20pt;
}
     div.sideOne{
        position: relative;
        transition:transform .9s;
        transform-style: preserve-3d;
        box-shadow: 2px 4px 8px 0 rgba(0, 0, 0, 0.2);
        width:100%;
        
    } 

     div#card:hover .sideOne{
        transform: rotateY(180deg)
    }

    .front, .back{
        
        -webkit-backface-visibility: hidden;
        backface-visibility: hidden;
    }
    .sideOne{
        background-color:rgb(247, 241, 234);
        border-style:inset;
        border-width: 1px;
        border-radius: 5px;
            }
    
    .back{
    transform: rotateY(180deg);
    } 
    
    p#question {
    border-width: 0px 0px 2px 0px;
    border-style:solid;
}

p#answer{
    border-width: 0px 0px 2px 0px;
    border-style:solid;
    ;
    /* color:white; */
}
/* p#answer:hover {
  color:black;
    
}  */

</style>