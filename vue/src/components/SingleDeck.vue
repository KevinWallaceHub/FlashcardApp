<template>
  <div>
<div> 
    
      {{deck.name}}
     </div>
  
  <div class="deckList">
       
           
      </div>
      </div>
</template>

<script>
// import DeckService from "@/services/DeckService.js"
export default {
data(){
    return {
        
        decks:[],
       
    };
},
props:['deck'],

methods: {
        
}
}
</script>

<style>

</style>