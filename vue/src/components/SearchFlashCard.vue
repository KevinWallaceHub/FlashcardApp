<template>
  <div>
    <label for="searchBar" >Search By Keyword:</label>
    <input type="text" id="searchBar" v-model="searchBar" 
    v-bind="mutationForSearchTerm()"
    />
    
  </div>
</template>

<script>
export default {
  data() {
    return {
      searchBar: "",
    };
  },
  methods: {
    resetFilteredList() {
          let empty = []
          this.filteredList = empty
    },
    mutationForSearchTerm() {
        this.$store.commit('SET_SEARCH_TERM', this.searchBar)
    }
  },
  computed: {

  }
};
</script>

<style>
</style>