<template>
  <div>
      <h1>Flashcards!</h1>
      <flash-card-list />
  </div>
</template>

<script>
import FlashCardList from '@/components/FlashCardList.vue'


export default {
    components: {
        FlashCardList
    }
}
</script>
<style>
h1{
    text-align: center;
}
</style>