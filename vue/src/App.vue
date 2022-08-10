<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view />
  </div>
</template>

<style>

div.nav {
    display: flex;
      align-items: center;
      justify-content: center;
      position: sticky;
      top: 0;
      cursor: pointer;
  }
  body {
    height: 125vh;
    background-size: cover;
    font-family: sans-serif;
}

main {
    color: white;
}

header {
    background-color: white;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    height: 80px;
}

</style>
