<template>
  <div class="home" >
    
    <div class="main">
      <h1>Welcome!</h1>
      <p class="greeting">
        Expanding your knowledge and studying hard is QwikFlip's number
        one goal!
      </p>
      <div class="maybe">
      <div id="userChoices">
      <div id="yourCardsDiv">
        <router-link :to="{ name: 'cards' }"
          ><button id="yourCards">Your cards</button></router-link
        >
      </div>
      <div id="yourDecksDiv">
        <router-link :to="{ name: 'decks' }"
          ><button id="yourDecks">Your decks</button></router-link
        >
      </div>
      <div id="yourDecksDiv">
        <router-link :to="{ name: 'StudySession' }"
          ><button id="yourDecks">Study Session</button></router-link
        >
      </div>
     
      </div>
       <!-- <div id="hp-image-container">
        <img id="homepage-image" src="@/images/engagement-to-autonomy.png"  alt="Homepage image">
    </div> -->
    </div>
      <div class="sidebars">
        <div class="sidebar1"></div>
        <div class="sidebar2"></div>
      </div>
    </div>
    
  </div>
  
</template>

<script>
export default {
  name: "home",
};
</script>


<style>
/* .maybe{
  display: flex;
  flex-direction: column;
  justify-content: center;
} */
/* #homepage-image {
    width: 100px;
   
    background-attachment: fixed;
}
#hp-image-container{
    width: 100%;
    grid-area:  main ;
    display: flex;
    justify-content: center;
   
    
} */
div.home {
  display: grid;
  grid-template-columns: 1fr 4fr 1fr;
  grid-template-areas: "sidebar1 main sidebar2";
  gap: 10px;
}
body {
  background-color: #e0fbfc;
  color: #293241;
}
h1 {
  text-align: justify;
}
p{
  text-align: center;
}
div.sidebars {
  background-color: #6d9f9c;
}
div.sidebar1 {
  grid-area: sidebar1;
}
div.sidebar2 {
  grid-area: sidebar2;
}
div.main {
  grid-area: main;
}
/* div#yourCardsDiv, div#yourDecksDiv {
  text-align: center;
} */
div#userChoices{
  display:flex;
  justify-content: space-evenly;
  margin:10px;
  padding: 30px;
  
}
button#yourCards, button#yourDecks {
  width: 9.7rem;
  padding: 10px;
  border-radius: 5px;
  color: #ffffff;
  background-color: #ee6c4d;
  font-weight: bold;
  text-align: center;
  text-transform: uppercase;
  cursor: pointer;
}

button#yourCards:hover, button#yourDecks:hover {
  background-color: #d44623;
  transition: 0.7s;
}


</style>