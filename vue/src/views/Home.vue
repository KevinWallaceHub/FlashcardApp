<template>
  <div class="home">
    <div class="main">
    <h1>Welcome!</h1>
    <p class="greeting">Expanding your knowledge and studying hard is {website name}'s number one goal!</p>
    <router-link :to="{ name: 'cards' }"
      ><button>Your cards</button></router-link
    >
    </div>
    <div class="sidebars">
      <div class="sidebar"></div>
      <div class="sidebar"></div>
    </div>
  </div>
</template>

<script>
export default {
  name: "home",
};
</script>


<style>
div.home {
  display: grid;
  grid-template-columns: 1fr, 4fr, 1fr;
  grid-template-areas: 
    "sidebar header sidebar"
    "sidebar main sidebar";
}
body {
  background-color: #dff0f9;
  color: #215350;
}
h1 {
  text-align: justify;
}

div.sidebar {
  grid-area: sidebar;
}
div.main {
  grid-area: main;
}
button {
    width: 25%;
    padding: 10px;
    border-radius: 5px;
    color: #ffffff;
    background-color: #e47b64;
    font-weight: bold;
    text-align: center;
    text-transform: uppercase;
}
</style>