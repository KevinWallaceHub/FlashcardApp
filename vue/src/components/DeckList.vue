<template>
  <div class="whole">
    <h1>Decks</h1>
    <div class="searchBar">
      <search-flash-card />
    </div>
    <div class="flashCardList">
      <flash-card
        v-for="currentFlashCard in searchFunctionForDeckList"
        :key="currentFlashCard.card_id"
        :flashcard="currentFlashCard"
      />
    </div>
<img class="infoButton" src="@/images/infobutton.png" alt="somthing" title="Drag to bar at top of deck to delete cards from deck">
    <div class="accContainer">
      <div class="flashCardListacc">
        <div class="flashCardListHover">
          <single-deck
            v-for="currentDeck in decks"
            v-bind:key="currentDeck.deck_id"
            v-bind:deck="currentDeck"
          />
        </div>
      </div>
    </div >
    
    <div class="createDeck">
      <form action="submit" class="createDeckForm" >
        <label for="name">Deck Name:</label>
        <input type="text" id="newDeckName" v-model="name" required />
        <button
          type="submit"
          class="submit"
          v-on:click.prevent="createNewDeck()"
        >
          Create Deck
        </button>
      </form>
      </div>
  </div>
</template>

<script>
import SingleDeck from "@/components/SingleDeck";
import deckService from "@/services/DeckService.js";
import SearchFlashCard from "@/components/SearchFlashCard.vue";
import flashCardService from "@/services/FlashCardService.js";
import FlashCard from "@/components/FlashCard.vue";
export default {
  components: {
    SingleDeck,
    SearchFlashCard,
    FlashCard,
  },
  data() {
    return {
      name: "",
      decks: [],
      newDeck: {},
      isActive: true,
    };
  },

  created() {
    deckService
      .getAllDecks()
      .then((response) => {
        this.decks = response.data;
      })
      .catch((error) => console.error(error));

    flashCardService
      .getAllFlashCards()
      .then((response) => {
        this.$store.state.flashCardList = response.data;
      })
      .catch((error) => console.error(error));
  },
  computed: {
    searchFunctionForDeckList() {
      const cardList = this.$store.state.flashCardList;
      const searchTerm = this.$store.state.searchTerm.toLowerCase();
      return cardList.filter((card) => {
        if (searchTerm.length > 0) {
          return card.keywords.toLowerCase().includes(searchTerm);
        } else {
          return false;
        }
      });
    },
  },
  methods: {
    createNewDeck() {
      if (this.name.length > 0) {
        const deck = {
          name: this.name,
          user_id: this.$store.state.user.id,
        };
        deckService
          .createNewDeck(deck)
          .then((response) => {
            this.decks.push(response.data);
          })
          .catch((err) => console.error(err));
      } else {
        alert("Name is a required field");
      }
    },
  },
};
</script>

<style>
.accContainer {
  margin: 30px auto;
  width: 100%;
  display: flex;
  justify-content: center;
  
}

.flashCardListHover {
  display: flex;
  flex-wrap: nowrap;
  overflow: hidden;
  width: 65%;
  height: 550px;
  box-shadow: 3px 3px 4px 0px black;
}

.flashCardListHover > div {
  width: 315px;
  flex-grow: 1;
  flex-shrink: 1;

  overflow-y: scroll;
  transition: all 0.5s ease;
  border: 2px solid #293241;
  /* border-radius: 5px; */

  position: relative;
  scroll-behavior: smooth;
}

.flashCardListHover > div::-webkit-scrollbar {
  display: none;
}

.flashCardListHover::-webkit-scrollbar{
 display: none;
}


.flashCardListacc {
  display: flex;
  flex-wrap: nowrap;
  overflow: hidden;
  width: 95%;
  height: 550px;
  box-shadow: 3px 3px 4px 0px black;
}

.flashCardListacc > div {
  width: 80%;
  flex-grow: 1;
  flex-shrink: 0;
  overflow-y: scroll;
  transition: all 0.5s ease;
  /* border:5px solid aliceblue;
  border-radius:10px; */

  position: relative;
  scroll-behavior: smooth;
}

.flashCardListHover > div:hover {
  flex-shrink: 0;
}
/* .flashCardListacc >div:hover{
  flex-shrink: 0;
  
} */
div.flashCardList {
  display: flex;
  flex-direction: row;
  justify-items: center;
  flex-wrap: wrap;
  justify-content: space-evenly;
}

.whole {
  display: flex;
  flex-direction: column;
}

input#searchBar{
  width: 500px;
}
input#newDeckName{
  width: 400px;
}
div.searchBar,
div.createDeck{
  border-style: solid;
  border-width: 2px;
  background-color: #98C1D9;
  display: flex;
  flex-direction: row;
  align-items: center;
  word-wrap: none;
  width: auto;
  justify-content: center;
  box-shadow: 2px 4px 7px 0 #2932417a;
  margin: auto;
  padding: 5px;
  border-radius: 5px;
  z-index: 1;
}
.infoButton{
  width: 25px;
  margin-left: 58px;
  
}
.infoButton:hover{
  cursor:pointer;
}
</style>