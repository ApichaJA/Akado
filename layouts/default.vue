<template>
  <main>
    <!-- Include NavBar -->
    <NavBar />

    <section class="min-h-screen max-w-full w-full grid grid-cols-1 mb-16">
      <Nuxt />
    </section>

    <footer>
      <FooterNav />
    </footer>
  </main>
</template>
<script>
export default {
  components: {
    NavBar: () => import("@/components/Navbar"),
    FooterNav: () => import("@/components/Footer"),
  },
}
</script>
