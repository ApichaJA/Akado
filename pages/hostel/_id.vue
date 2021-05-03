<template>
  <section class="flex flex-col justify-start items-center space-y-12">
    <Hero
      :data="{ name: hostel.name, address: hostel.address }"
      :isFluid="true"
    />

    <div class="box max-w-4xl w-full">
      {{ hostel }}
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
      `http://localhost:5000/api.akado/v1/hostel/${params.id}`
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
