<template>
  <div>
<!--     
      {{ flashcard.user_id}}
      {{flashcard.keywords}}
      {{flashcard.card_id}}
       -->
      {{flashcard.question_side}}
      {{flashcard.answer_side}}

  </div>
</template>

<script>

export default {
    props: ['flashcard']
    ,
    computed: {

    },
}
</script>

<style>

</style>