<template>
  <nav class="main-nav">
    <div class="top-nav">
      <div class="wrap-container py-4 flex justify-end">
        <div v-if="!$auth.loggedIn" class="links space-x-3">
          <nuxt-link :to="'/register'">Register</nuxt-link>
          <nuxt-link :to="'/login'">Log in</nuxt-link>
        </div>
        <div v-else class="links space-x-3">
          <nuxt-link :to="'/account'">Account</nuxt-link>
          <a @click="$auth.logout()">Log out</a>
        </div>
      </div>
    </div>
    <div class="primary-nav">
      <div class="wrap-container flex justify-center items-center py-12">
        <h1 class="logo">
          {{ this.$store.getters["page/getPage"] || "K-DORM" }}
        </h1>
      </div>
      <div class="page-title">Book what's you like!</div>
    </div>
  </nav>
</template>
<style scoped>
.main-nav {
  background-image: url("https://www.dusit.com/dusitthani-mactancebu/wp-content/uploads/sites/21/cache/2020/02/DTMC-1920x900_exterior-min/3320802311.jpg");
  background-size: 100%;
  background-position: bottom;
  @apply relative grid grid-cols-1 w-full place-items-start place-content-start;
}

.main-nav::before {
  content: "";
  background-image: linear-gradient(
    to bottom,
    transparent,
    rgba(0, 0, 0, 0.45)
  );
  @apply absolute top-0 left-0 w-full h-full  backdrop-filter backdrop-blur-md backdrop-brightness-90;
}

.main-nav .top-nav {
  @apply bg-transparent w-full text-gray-50 flex justify-center items-center font-normal px-6 z-10;
}

.main-nav .primary-nav {
  @apply bg-transparent w-full text-white flex justify-center items-center relative px-6 z-10;
}

.main-nav .primary-nav .page-title {
  bottom: -1.2rem;
  left: 50%;
  transform: translateX(-50%);
  max-width: 250px;
  @apply absolute bg-secondary py-2 px-6 font-semibold text-white text-center text-lg w-full rounded-3xl;
}

.main-nav .top-nav .links {
  @apply flex flex-nowrap items-center text-base font-medium;
}
.main-nav .top-nav .links a:hover {
  @apply underline text-gray-100;
}

.main-nav .primary-nav .logo {
  @apply text-4xl font-bold -mt-6 mb-3;
}
</style>
