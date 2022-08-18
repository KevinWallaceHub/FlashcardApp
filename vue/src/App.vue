<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">
        <img src="@/images/new logo no bkg.png" alt="Logo" class="logo" />
      </router-link>
      <nav>
        
        <ul class="nav__links">
          <li class="navs">
            <router-link v-bind:to="{ name: 'home' }">Home</router-link
            >&nbsp;&nbsp;
          </li>
          <li class="navs">
            <router-link
              v-bind:to="{ name: 'cards' }"
              v-if="$store.state.token != ''"
              >My Cards</router-link
            >
          </li>
          <li class="navs">
            <router-link
              v-bind:to="{ name: 'decks' }"
              v-if="$store.state.token != ''"
              >My Decks</router-link
            >
          </li>
          <li class="navs">
            <div id="yourDecksDiv">
              <router-link :to="{ name: 'StudySession' }"
                >Study Session</router-link
              >
            </div>
          </li>
        </ul>
      </nav>
      <button id="logout">
        <router-link id="logoutlink"
          v-bind:to="{ name: 'logout' }"
          v-if="$store.state.token != ''"
          >Logout</router-link
        >
      </button>
    </div>
    <router-view />
    
  </div>
</template>
<script>

</script>


<style>
@import url("https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@600&display=swap");

* {
  font-family: "Nunito Sans", sans-serif;
}
div#nav {
  display: flex;
  box-sizing: border-box;
  flex-wrap: wrap;
  margin: 0;
  padding: 0;
  background-image: linear-gradient(to right, #e0fbfc, #98c1d9);
  border-width: 0px 0px 3px 0px;
  border-style: solid;
  border-color: antiquewhite;
  height: 30%;
  justify-content: space-between;
  align-items: center;
  z-index: 1;
  border-bottom: 2px solid #333333;
}
body {
  background-image: linear-gradient(to right, #e0fbfc, #98c1d9);
}
li.navs {
  font-family: "Nunito Sans", sans-serif;
  font-weight: 600;
  font-size: 20px;
  color: #3d5a80;
  text-decoration: none;
}
ul.nav__links {
  display: flex;
  flex-wrap: wrap;
  font-weight: bold;
  
}
img.logo {
  max-width: 300px;
  height: auto;
  padding: 1rem;
}
.nav__links {
  list-style: none;
}
.nav__links li {
  padding: 0px 20px;
  text-transform: uppercase;
  text-decoration: none;
}
.nav__links li router-link {
  transition: all 0.3s ease 0s;
  text-transform: uppercase;
  text-decoration: none;
}
.nav__links li a:hover {
  color: #293241;
}
.nav__links li a {
  text-decoration: none;
  text-transform: uppercase;
  color: #3d5a80;
  font-weight: bold;
}
nav {
  
  display: flex;
  flex-wrap: wrap;
}
button#logout {
  padding: 9px 25px;
  margin-right: 50px;
  background-color: #293241;
  color: #e0fbfc;
  border: none;
  border-radius: 50px;
  cursor: pointer;
  transition: all 0.3s ease;
}
a#logoutlink{
  color: #e0fbfc;
  text-decoration: none;
}
a#logoutlink:hover{
  color:#afc3c4;
}
</style>