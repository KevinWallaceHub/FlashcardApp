<template>
  <div>
    <!-- Search By Keyword: -->
    <label for="searchBar" ></label>
    <input type="text" placeholder="Search By Keyword" id="searchBar" v-model="searchBar" 
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
input#searchBar{
  
  position: fixed;
  background-color: #DFF0F9;
  margin:5px;
  border-style:solid;
  border-radius:5px;
  height: 1rem;
  font-family:'Courier New', Courier, monospace 
}
</style>