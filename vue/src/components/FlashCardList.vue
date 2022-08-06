<template>
  <div class="flashCardList">
    <flash-card 
     v-for="currentFlashCard in flashCardList"
     :key="currentFlashCard.card_id"
     :flashcard="currentFlashCard"/>
  </div>
</template>

<script>
import FlashCard from "@/components/FlashCard.vue";
import flashCardService from "@/services/FlashCardService.js";

export default {
  components: {
    FlashCard,
  },
  data() {
    return {
      flashCardList: [],
    };
  },
  created() {
    flashCardService
      .getAllFlashCards()
      .then((response) => {
        this.flashCardList = response.data;
        console.log(this.flashCardList);
      })
      .catch((error) => console.error(error));
  },
};
</script>

<style>
</style>