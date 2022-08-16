<template>
  <div id="cardForm">
    <div class="singleCard" v-if="this.$store.state.showEdit">
      <form action="submit">
        <!-- <p>Username: {{ flashcard.user_id }}</p>
      <p>Card ID{{ flashcard.card_id }}</p> -->
        <div id="questionSide">
          <label for="questionSide">Question: </label>
          <textarea
            rows="3"
            cols="100"
            type="textbox"
            id="questionSide"
            v-model="questionSide"
          />
        </div>
        <div id="answerSide">
          <label for="answerSide">Answer: </label>
          <textarea rows="6" type="text" id="answerSide" v-model="answerSide" />
        </div>
        <div id="keywords">
          <label for="keywords">Keywords: </label>
          <input type="text" id="keywords" v-model="keywords" />
        </div>
        <div id="imageUpload">
          <label for="imageURL">Upload image:</label>
          <input type="file" @change="previewFile" />
        </div>
        <div class="allEditFormBtn">
          <div>
            <button
              class="submit"
              id="submitButton"
              @click.prevent="
                updateSelectedFlashcard(),
                  toggleShowEdit(),
                  addImage(previewFile)
              "
            >
              Update
            </button>
            <button class="cancel" v-on:click.prevent="toggleShowEdit()">
              Cancel
            </button>
          </div>
          <div>
            <form action="submit">
              <label for="Decks"></label>
              <select name="Decks" id="Decks" v-model="value">
                <option></option>
                <option
                  v-for="deck in this.deckList"
                  :key="deck.deck_id"
                  :value="deck.deck_id"
                >
                  {{ deck.name }}
                </option>
              </select>

              <button class="addToDeck" @click.prevent="addFlashCardToDeck()">
                Add To Deck
              </button>
            </form>
          </div>
          <div>
            <button
              class="delete"
              v-on:click.prevent="toggleShowEdit(), deleteSelectedFlashcard()"
            >
              Delete
            </button>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import flashCardService from "@/services/FlashCardService.js";
import deckService from "@/services/DeckService";
import { getStorage, ref, uploadBytes } from "firebase/storage";

const storage = getStorage();
const imageRef = ref(storage, "image/");
export default {
  data() {
    return {
      questionSide: this.flashcard.question_side,
      answerSide: this.flashcard.answer_side,
      keywords: this.flashcard.keywords,
      deckList: [],
      value: "",
      fileName: "",
    };
  },
  mounted() {},
  props: ["flashcard"],
  computed: {
    // getFileName() {
    //   return (this.fileName = document.getElementById("submitButton").name);
    // },
  },
  created() {
    deckService
      .getAllDecks()
      .then((response) => {
        this.deckList = response.data;
      })
      .catch((error) => console.error(error));
  },

  methods: {
    previewFile(event) {
      console.log(event.target.files);
      return event.target.files;
    },

    addImage(file) {
      uploadBytes(imageRef, file).then((snapshot) => {
        console.log("Uploaded file!");
        console.log(snapshot);
      });
    },
    // changingCurrentDeck(){
    //     let selecetedDeck = {};
    //     console.log(this.value);
    //     this.deckList.forEach(deck => {
    //          if(deck.deck_id == this.value)
    //         { selecetedDeck = deck}
    //     })
    //     this.$store.commit('SET_CURRENT_DECK', selecetedDeck)
    // },
    addFlashCardToDeck() {
      // console.log(this.value);
      deckService
        .addFlashCardToDeck(this.value, this.flashcard)
        .then((response) => {
          console.log(response.data);
          alert("card was added to deck successfully");
        })
        .catch((err) => console.error(err));
    },
    toggleShowEdit() {
      this.$store.commit("SET_SHOW_EDIT", false);
    },
    resetData() {
      this.questionSide = "";
      this.answerSide = "";
      this.keywords = "";
    },
    updateSelectedFlashcard() {
      const updatedFlashcard = {
        card_id: this.flashcard.card_id,
        question_side: this.questionSide,
        answer_side: this.answerSide,
        keywords: this.keywords,
        user_id: this.$store.state.user.id,
      };
      flashCardService
        .updateFlashCard(updatedFlashcard.card_id, updatedFlashcard)
        .then((response) => {
          if (response.status === 200) {
            // console.log(response);
            this.$store.state.flashCardList.push(updatedFlashcard);
            let index = this.$store.state.flashCardList.indexOf(this.flashcard);
            if (index !== -1) {
              this.$store.state.flashCardList.splice(index, 1);
            }
            alert("updated success");
            this.resetData();
          }
        })
        .catch((err) => {
          console.error(err);
        });
    },

    deleteSelectedFlashcard() {
      if (confirm("Are your sure you would like to delete this Flashcard?")) {
        const unwantedFlashcard = {
          card_id: this.flashcard.card_id,
          question_side: this.questionSide,
          answer_side: this.answerSide,
          keywords: this.keywords,
          user_id: this.$store.state.user.id,
        };

        flashCardService
          .deleteFlashCard(unwantedFlashcard.card_id)
          .then((response) => {
            if (response.status < 300) {
              let index = this.$store.state.flashCardList.indexOf(
                unwantedFlashcard.card_id
              );
              this.$store.state.flashCardList.splice(index, 1);
              alert("Flashcard Deleted Forever");
            }
          })
          .catch((err) => console.error(err));
      }
    },
  },
};
</script>

<style>
div#cardForm {
  display: flex;
  justify-content: center;
  align-items: center;
  position: absolute;
}
div.singleCard {
  color: rgb(4, 65, 65);
  border-style: solid;
  border-width: 2px;
  background-color: white;
  display: flex;
  word-wrap: none;
  flex-direction: row;
  justify-content: space-around;
  box-shadow: 2px 4px 7px 0 #e47b64;
  margin-bottom: 10px;
  margin-right: 5px;
  border-radius: 5px;
  z-index: 1;
  position: fixed;
  /* right: 25rem; */
  top: 40%;
}
div#questionSide,
div#answerSide,
div#keywords {
  display: flex;
  flex-direction: column;
  margin: 5px;
}

div.allEditFormBtn {
  display: flex;
  justify-content: space-between;
}

button.cancel,
button.delete,
button.addToDeck {
  margin: 5px;
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
button.cancel:hover,
button.delete:hover {
  background-color: #d44623;
  transition: 0.7s;
}
</style>