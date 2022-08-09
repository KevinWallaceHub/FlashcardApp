<template>
  <div>
      <label for="searchBar" v-bind="search()">Search By Keyword:</label>
      <input type="text" id="searchBar" v-model="searchBar">
      
  </div>
</template>

<script>


export default {
    data() {
        return {
            searchBar: "",
            filteredList: []
        }
    },
    methods: {
        search() {
            // let input = this.searchBar;
             return this.filteredList = this.$store.state.flashCardList.filter(flashcard =>{
                 
             return flashcard.keywords.includes(this.searchBar)});
           
            
        }
    }
}
</script>

<style>

</style>