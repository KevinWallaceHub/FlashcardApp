<template>
  <div
    id="card"
    v-on:click="getCardId(), toggleShowEdit()"
    draggable="true"
    @dragstart="dragStart($event, flashcard)"
  >
    <div class="sideOne">
      <div class="front">
        <span id="question">{{ flashcard.question_side }}</span>
        <img :src="this.image" alt="" />
      </div>
      <div class="back">
        <span id="answer">{{ flashcard.answer_side }} </span>
      </div>
    </div>
  </div>
</template>

<script>
// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getStorage, ref, getDownloadURL } from "firebase/storage";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyDNwUAfWMlZ0_LW4L4iaf2qu1DQczthmS8",
  authDomain: "qwikflipecho.firebaseapp.com",
  projectId: "qwikflipecho",
  storageBucket: "qwikflipecho.appspot.com",
  messagingSenderId: "193713042654",
  appId: "1:193713042654:web:94014e9299a3fcbbfa7e4f",
};

// Initialize Firebase
const firebase = initializeApp(firebaseConfig);
const storage = getStorage();
const starsRef = ref(
  storage,
  "image/27b711ba595fca0c82e083a641560d6f--abstract-photos-abstract-backgrounds.jpg"
);

export default {
  data() {
    return {
      currentCard: {},
      image: "",
    };
  },
  mounted() {
    console.log(firebase);
    getDownloadURL(starsRef).then((url) => {
      this.image = url;
    });
  },
  computed: {},
  methods: {
    toggleShowEdit() {
      this.$store.commit("SET_SHOW_EDIT", true);
    },

    dragStart(evt, flashcard) {
      flashcard = this.flashcard;

      evt.dataTransfer.dropEffect = "move";
      evt.dataTransfer.effectAllowed = "move";
      evt.dataTransfer.setData("flashcardId", flashcard.card_id);
    },
    getCardId() {
      this.currentCard = this.flashcard;
      this.$store.commit("SET_CURRENT_CARD", this.currentCard);
      // console.log(this.$store.state.currentCard);
    },
  },

  props: ["flashcard"],
};
</script>

<style>
div#card {
  display: flex;
  /* border: 2px;
    border-style:solid; */
  margin: 10px;
  justify-content: space-evenly;
  flex-direction: row;
  width: 300px;
  perspective: 1000px;
  background-color: transparent;
  font-size: 0.9em;
  height: 300px;
  text-align: center;
}
div.sideOne {
  position: relative;
  transition: transform 0.9s;
  transform-style: preserve-3d;
  box-shadow: 2px 4px 8px 0 #e47b64;
  width: 100%;

  justify-content: center;
}

div#card:hover .sideOne {
  transform: rotateY(180deg);
}

.front,
.back {
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
}
.front {
  font-size: 1.5em;
  position: relative;
  top: 25%;
}
.sideOne {
  background-color: rgb(247, 241, 234);
  border-style: solid;
  border-color: rgb(4, 65, 65);
  border-width: 1.5px;
  border-radius: 5px;
}

.back {
  transform: rotateY(180deg);
  /* this bit here makes the answer side of the card fit 
    but for short cards the answer is down at the bottom... not ideal  */
  position: absolute;
  top: 1%;
  font-size: 10pt;
}

span#question {
  border-width: 0px 0px 2px 0px;
  border-style: solid;
}

/* p#answer{
    border-width: 0px 0px 2px 0px;
    border-style:solid;
  
} */
img {
  max-width: 250px;
  max-height: auto;
}
</style>