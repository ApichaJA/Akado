<template>
  <section
    class="wrap-container mx-auto flex flex-col space-y-16 place-items-start w-full"
  >
    <searchBox />

    <div class="slider">
      <img
        src="https://www.dusit.com/wp-content/uploads/cache/2020/03/DTHH_swimming_pool2_low/2377309350.jpg"
      />
      <div class="caption">
        <h1>DUSIT THANI</h1>
        <p>Phuket, Thailand</p>
      </div>
    </div>

    <section class="slide-box space-y-4 max-w-full">
      <h1 class="section-headline">Recommended Hotels</h1>
      <client-only>
        <Slide />
      </client-only>
    </section>

    <section class="slide-box space-y-4 max-w-full">
      <h1 class="section-headline">Hot Deals</h1>
      <client-only>
        <Slide />
      </client-only>
    </section>
  </section>
</template>

<script>
import { mapGetters } from "vuex"

export default {
  components: {
    Slide: () => import("@/components/postSlide"),
    searchBox: () => import("@/components/searchBox"),
  },
  data() {
    return {}
  },
  computed: {
    ...mapGetters("hotels", ["getHotels"]),
  },
}
</script>
<style scoped>
/* .slide-wrap {
} */

.slider {
  position: relative;
  width: 100%;
  height: 66.66%;
}

.slider::after {
  display: block;
  content: "";
  padding-bottom: 56.25%;
}

.slider img {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  @apply object-cover rounded-xl;
}

.slider .caption {
  background-image: linear-gradient(to top, rgba(29, 29, 29, 0.9), transparent);
  @apply grid grid-cols-1 gap-y-1 absolute bottom-0 left-0 rounded-b-xl w-full py-6 text-white px-6 backdrop-filter backdrop-blur-sm backdrop-brightness-50;
}

.slider .caption h1 {
  @apply font-bold text-3xl;
}

.slider .caption p {
  @apply font-semibold text-xl text-gray-300;
}

@media (min-width: 768px) {
  .slider .caption h1 {
    @apply text-4xl;
  }

  .slider .caption p {
    @apply text-xl;
  }
}

.slide-box {
  @apply flex flex-col;
}

.slide-box h1.section-headline {
  @apply font-bold;
}
</style>
