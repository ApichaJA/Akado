<template>
  <nav class="fixed-bottom-nav">
    <div class="nav-container space-x-4">
      <nuxt-link
        v-for="(item, i) in navItems"
        :key="i"
        :to="item.href"
        class="nav-item"
        :class="{ active: $route.name === item.name }"
      >
        <b-icon :icon="item.title" size="is-medium"> </b-icon>
      </nuxt-link>
    </div>
  </nav>
</template>
<script>
export default {
  data() {
    return {
      navItems: [
        {
          href: "/chat",
          name: "chat",
          title: "chat",
        },
        {
          href: "/",
          name: "index",
          title: "home",
        },
        {
          href: "/account",
          name: "account",
          title: "account",
        },
      ],
    }
  },
}
</script>
<style scoped>
.fixed-bottom-nav {
  @apply fixed bottom-0 left-0 flex items-center justify-center flex-nowrap w-full bg-gray-50 border-gray-100 border-t border-solid;
}

.fixed-bottom-nav .nav-container {
  @apply max-w-4xl flex items-stretch justify-between;
}

.fixed-bottom-nav .nav-container .nav-item {
  @apply flex items-center justify-center p-4 text-gray-400 font-bold;
}

.fixed-bottom-nav .nav-container .nav-item.active {
  @apply bg-gray-200 text-blue-800;
}
</style>
