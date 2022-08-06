<template>
  <div class="flashCardList">
    <flash-card />
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
      })
      .catch((error) => console.error(error));
  },
};
</script>

<style>
</style>