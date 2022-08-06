<template>
  <div id="card">
<!--     
      {{ flashcard.user_id}}
      {{flashcard.keywords}}
      {{flashcard.card_id}}
       -->
      <div 
       ><p  id="question">{{flashcard.question_side}}</p>
      <p id="answer">{{flashcard.answer_side}}</p></div>
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
    border: 5px;
    border-style:double;
    margin: 10px;
    text-align: center;
    justify-content: center;
    flex-direction: row;
    width:25%;
    
  
}

p#question {
  
    border-width: 0px 0px 3px 0px;
    border-style: solid;
}
p#answer{
    color:white;
}
p#answer:hover {
  color:black;
    
}

</style>