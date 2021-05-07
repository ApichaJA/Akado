<template>
  <section>
    <div v-if="type === 'non-booking'" class="hostel-wrap">
      <nuxt-link
        v-for="(item, i) in data"
        :key="i"
        :to="`/hostel/${item.hostel_id}`"
        class="slide-img"
      >
        <img :src="item.image" />
        <div class="slide-title antialiased">{{ item.name }}</div>
      </nuxt-link>
    </div>
    <splide v-else-if="type === 'booking'" :options="options" class="max-w-4xl">
      <splide-slide v-for="(item, i) in data" :key="i">
        <nuxt-link
          :to="`/hostel/${item.ROOM.hostel_hostel_id}`"
          class="slide-img"
        >
          <img
            src="https://live.staticflickr.com/4154/4973067641_4d8eacf302_b.jpg"
          />
          <div class="slide-title antialiased">{{ item.hostel_name }}</div>
        </nuxt-link>
      </splide-slide>
    </splide>
  </section>
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
    type: {
      type: String,
      require: false,
      default() {
        return ""
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
.hostel-wrap {
  @apply grid grid-cols-1 gap-y-8 gap-x-4 place-content-start place-items-start;
}

@screen sm {
  .hostel-wrap {
    @apply grid-cols-2;
  }
}

@screen md {
  .hostel-wrap {
    @apply grid-cols-3;
  }
}

@screen lg {
  /* .hostel-wrap {
    @apply grid-cols-4;
  } */
}

.slide-img {
  @apply rounded-md relative block overflow-hidden  transition-all ease-linear duration-200;
}

.slide-img .slide-title {
  @apply absolute bottom-0 left-0 h-full opacity-0 flex justify-center items-center transition-all ease-linear duration-200 overflow-hidden backdrop-filter backdrop-brightness-50 backdrop-blur-lg w-full px-4 py-8 text-white font-semibold text-lg;
}

.slide-img:hover {
  @apply opacity-90;
}

.slide-img:hover .slide-title {
  @apply opacity-100 font-light;
}

.slide-img img {
  @apply block object-cover w-full h-48;
}
</style>
