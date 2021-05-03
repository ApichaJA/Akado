<template>
  <div class="slider">
    <img
      src="https://www.dusit.com/wp-content/uploads/cache/2020/03/DTHH_swimming_pool2_low/2377309350.jpg"
      :class="{'rounded-xl': !isFluid}"
    />
    <div class="caption" :class="{'rounded-b-xl': !isFluid}">
      <h1>{{ data.name }}</h1>
      <p>{{ data.address }}</p>
    </div>
  </div>
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
    isFluid: {
      type: Boolean,
      require: false,
      default() {
        return false
      },
    },
  },
}
</script>
<style scoped>
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
  @apply object-cover;
}

.slider .caption {
  background-image: linear-gradient(to top, rgba(29, 29, 29, 0.9), transparent);
  @apply grid grid-cols-1 gap-y-1 absolute bottom-0 left-0 w-full py-6 text-white px-6 backdrop-filter backdrop-blur-sm backdrop-brightness-50;
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
</style>
