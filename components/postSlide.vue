<template>
  <splide :options="options" class="max-w-4xl">
    <splide-slide>
      <nuxt-link :to="'/'" class="slide-img">
        <img
          src="https://mpics.mgronline.com/pics/Images/563000009856102.JPEG"
        />
        <div class="slide-title">Belmond Hotel Cipriani, Venice.</div>
      </nuxt-link>
    </splide-slide>
    <splide-slide>
      <nuxt-link :to="'/'" class="slide-img">
        <img
          src="https://exp.cdn-hotels.com/hotels/9000000/8340000/8332100/8332098/cec73658_z.jpg?impolicy=fcrop&w=500&h=333&q=medium"
        />
        <div class="slide-title">Crown Towers Melbourne, Australia.</div>
      </nuxt-link>
    </splide-slide>
    <splide-slide>
      <nuxt-link :to="'/'" class="slide-img">
        <img
          src="http://www.thaiticketmajor.com/variety/img_news/title/original1/2488/11488/title_ttmnews_11488-20190529124523.jpg"
        />
        <div class="slide-title">The Darling, Pyrmont, Australia.</div>
      </nuxt-link>
    </splide-slide>
    <splide-slide>
      <nuxt-link :to="'/'" class="slide-img">
        <img
          src="https://mpics.mgronline.com/pics/Images/562000008632302.JPEG"
        />
        <div class="slide-title">Faena Hotel Miami Beach.</div>
      </nuxt-link>
    </splide-slide>
    <splide-slide>
      <nuxt-link :to="'/'" class="slide-img">
        <img
          src="https://assets.brandinside.asia/uploads/2020/03/34386191_2039059029689251_4044904219738636288_o.jpg"
        />
        <div class="slide-title">Fairmont Grand Del Mar, San Diego.</div>
      </nuxt-link>
    </splide-slide>
    <splide-slide>
      <nuxt-link :to="'/'" class="slide-img">
        <img
          src="https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/df/18/a9/entrance.jpg?w=600&h=300&s=1"
        />
        <div class="slide-title">
          Four Seasons Hotel Gresham Palace Budapest.
        </div>
      </nuxt-link>
    </splide-slide>
    <splide-slide>
      <nuxt-link :to="'/'" class="slide-img">
        <img
          src="https://i0.wp.com/www.hotelthailandtomorrow.com/wp-content/uploads/2019/09/ASAI-Chinatown_Exterior-e1567570743818.jpg?resize=640%2C386"
        />
        <div class="slide-title">Four Seasons Resort Bali at Sayan.</div>
      </nuxt-link>
    </splide-slide>
  </splide>
</template>
<script>
export default {
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
  @apply mb-0;
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
