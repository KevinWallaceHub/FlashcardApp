<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">
        <img src="@/images/logo cropped.png" alt="Logo" class="logo" />
      </router-link>
      <nav>
        <ul class="nav__links">
          <li class="navs">
            <router-link v-bind:to="{ name: 'home' }">Home</router-link
            >&nbsp;&nbsp;
          </li>
          <li class="navs">
            <router-link
              v-bind:to="{ name: 'logout' }"
              v-if="$store.state.token != ''"
              >Logout</router-link
            >
          </li>
          <li class="navs">
            <router-link
              v-bind:to="{ name: 'cards' }"
              v-if="$store.state.token != ''"
              >My Cards</router-link
            >
          </li>
        </ul>
      </nav>
    </div>
    <router-view />
  </div>
</template>

<style>
@import url("https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@600&display=swap");
div#app {
  background-image: linear-gradient(to bottom right, #dff0f9, #215350);

  /* background-image: linear-gradient(rgba(0, 0, 255, 0.5), rgba(255, 255, 0, 0.5)),
                  url("../../media/examples/lizard.png"); */
}
* {
  font-family: "Nunito Sans", sans-serif;
}
div#nav {
  display: flex;
  box-sizing: border-box;
  margin: 0;
  padding: 0;
  background-color: #dff0f9;
  justify-content: space-between;
  align-items: center;
}
li.navs {
  font-family: "Nunito Sans", sans-serif;
  font-weight: 600;
  font-size: 16px;
  color: #215350;
  text-decoration: none;
}
img.logo {
  max-width: auto;
  height: auto;
}
.nav__links {
  list-style: none;
}
.nav__links li {
  display: inline-block;
  padding: 0px 20px;
}
.nav__links li router-link {
  transition: all 0.3s ease 0s;
}
.nav__links li router-link:hover {
  color: blue;
}
</style>