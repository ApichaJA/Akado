<template>
  <section
    class="wrap-container mx-auto flex flex-col space-y-16 place-items-start w-full px-4 py-24"
  >
    <searchBox />

    <Hero :data="{ name: 'DUSIT THANI', address: 'Phuket, Thailand' }" />

    <section class="slide-box space-y-4 max-w-full">
      <h1 class="section-headline">Recommended Hotels</h1>
      <client-only>
        <Slide :data="hotels" />
      </client-only>
    </section>

    <section class="slide-box space-y-4 max-w-full">
      <h1 class="section-headline">Hot Deals</h1>
      <client-only>
        <Slide :data="hotels" />
      </client-only>
    </section>
  </section>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  components: {
    Slide: () => import("@/components/postSlide"),
    searchBox: () => import("@/components/searchBox"),
    Hero: () => import("@/components/headlineHero")
  },
  data() {
    return {
      hotels: null,
    }
  },
  created() {
    this.getHotels()
    this.setPage('K-DORM')
  },
  methods: {
    ...mapActions("page", ['setPage']),
    async getHotels() {
      try {
        const { data } = await this.$axios.get(
          "/connect/api.akado/v1/getAllHostel"
        )

        this.hotels = data
      } catch (e) {
        console.error(e)
      }
    },
  },
}
</script>
<style scoped>
/* .slide-wrap {
} */

.slide-box {
  @apply flex flex-col;
}

.slide-box h1.section-headline {
  @apply font-bold;
}
</style>
