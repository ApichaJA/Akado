<template>
  <splide :options="options" class="max-w-4xl">
    <splide-slide v-for="(item, i) in data" :key="i">
      <nuxt-link :to="`/hostel/${item.hostel_id}`" class="slide-img">
        <img
          src="https://mpics.mgronline.com/pics/Images/563000009856102.JPEG"
        />
        <div class="slide-title antialiased">{{ item.name }}</div>
      </nuxt-link>
    </splide-slide>
  </splide>
</template>
<script>
export default {
  props: {
    data: {
      type: [Object, Array],
      require: true,
      default() {
        return null
      },
    },
  },
  data() {
    return {
      options: {
        type: "loop",
        perPage: 4,
        perMove: 1,
        gap: "1rem",
        pagination: false,
        lazyLoad: "sequential",
        focus: false,
        cover: true,
        height: "170px",
      },
    }
  },
}
</script>
<style scoped>
.slide-img {
  @apply rounded-md relative block h-full overflow-hidden  transition-all ease-linear duration-200;
}

.slide-img .slide-title {
  @apply absolute bottom-0 left-0 -mb-80 flex justify-center items-center transition-all ease-linear duration-200 overflow-hidden backdrop-filter backdrop-brightness-50 backdrop-blur-lg w-full p-4 text-white font-semibold text-lg h-full w-full;
}

.slide-img:hover {
  @apply opacity-90;
}

.slide-img:hover .slide-title {
  @apply mb-0 font-light;
}

.slide-img img {
  @apply block h-full;
}

* >>> .splide__arrow {
  height: 100%;
  @apply px-2;
}

* >>> .splide__arrow:hover {
  @apply backdrop-filter backdrop-brightness-75;
}

* >>> .splide__arrow svg {
  fill: rgb(221, 221, 221);
  @apply opacity-0 transition-all duration-200 ease-linear;
}

* >>> .splide__arrow:hover svg {
  @apply opacity-100;
}

* >>> .splide__arrow--prev {
  left: 0;
  background-image: linear-gradient(
    to right,
    rgba(75, 75, 75, 0.377),
    transparent
  );
}

* >>> .splide__arrow--next {
  right: 0;
}
</style>
