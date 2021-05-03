<template>
  <section class="flex flex-col justify-start items-center space-y-12">
    <Hero
      :data="{ name: hostel.name, address: hostel.address }"
      :isFluid="true"
    />

    <div class="box max-w-4xl w-full flex flex-row items-center font-sans space-x-2 font-semibold">
      <div class="flex items-center space-x-1">
        <b-icon icon="currency-usd" size="is-small"></b-icon>
        <span>{{ hostel.min_price }}</span>
      </div>
      <span>-</span>
      <div class="flex items-center space-x-1">
        <span class="flex items-center -space-x-2">
        <b-icon icon="currency-usd" size="is-small"></b-icon>
        <b-icon icon="currency-usd" size="is-small"></b-icon>
        </span>
        <span>{{ hostel.max_price }}</span>
      </div>
    </div>

    <div class="max-w-4xl w-full grid grid-cols-1 gap-y-4">
      <h1 class="font-bold">Available Rooms</h1>
      <div class="box p-6">
        test
      </div>
    </div>
  </section>
</template>
<script>
import { mapActions } from "vuex"

export default {
  components: {
    Hero: () => import("@/components/headlineHero"),
  },
  async asyncData({ params, $http }) {
    const hostel = await $http.$get(
      `/connect/api.akado/v1/hostel/${params.id}`
    )

    return { hostel }
  },
  created() {
  //  this.setPage(this.hostel.name)
  },
  methods: {
    ...mapActions("page", ["setPage"]),
  },
}
</script>
