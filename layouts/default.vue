<template>
  <main>
    <!-- Include NavBar -->
    <NavBar />

    <section class="min-h-screen max-w-full w-full grid grid-cols-1">
      <Nuxt />
    </section>
  </main>
</template>
<script>
export default {
  components: {
    NavBar: () => import("@/components/Navbar"),
  },
}
</script>
