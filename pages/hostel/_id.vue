<template>
  <section class="flex flex-col justify-start items-center space-y-12">
    <Hero
      :data="{ name: hostel.name, address: hostel.address }"
      :is-fluid="true"
    />

    <div
      class="box max-w-4xl w-full flex flex-row items-center font-sans space-x-2 font-semibold"
    >
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
      <div v-if="rooms && rooms !== null" class="room-wrap">
        <div
          v-for="(item, i) in getRoomsWithRandomImage"
          :key="i"
          class="box room-item space-y-6 md:space-y-0 space-x-0 md:space-x-6"
        >
          <div class="room-thumbnail">
            <img :src="item.img" />
          </div>
          <div class="room-content">
            <h1>
              {{ item.type_name }}
            </h1>
            <span>
              {{ item.price_month && item.price_month + "฿/month" }}
            </span>
            <nuxt-link
              class="bg-gray-700 text-white px-4 py-2 mt-4 rounded-md hover:text-gray-50 hover:bg-primary"
              :to="`/booking/${item.room_id}`"
            >
              Book now
            </nuxt-link>
          </div>
        </div>
      </div>
      <div v-else class="box p-6 flex justify-center">
        <span class="block mx-auto text-gray-500"> - No Available Room - </span>
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
      `/connect/api.akado/v1/getHostel/${params.id}`
    )

    return { hostel }
  },
  data() {
    return {
      rooms: null,
      hotelRoom: [
        "https://www.ggrasia.com/wp-content/uploads/2015/05/JW-Marriot-hotel-room-Galaxy-Macau-Phase-2-e1432637852679.jpg",
        "https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Hotel-room-renaissance-columbus-ohio.jpg/1280px-Hotel-room-renaissance-columbus-ohio.jpg",
        "https://pix10.agoda.net/hotelImages/5668227/0/7542736b26b0676a0e9e3c4aab831241.jpg?s=1024x768",
        "https://cdn.galaxy.tf/unit-media/tc-default/uploads/images/room_photo/001/579/602/dlx3-standard.jpg",
        "https://assets1.hospitalitytech.com/styles/content_md/s3/2018-06/LuMINN%20room%2054.jpg?itok=l6ngXlgT",
        "https://wardandco.com/wp-content/uploads/2021/03/HOTEL-BLOG-1.jpg",
        "https://lh3.googleusercontent.com/proxy/Bqr3tspszNUF3i9RhGu-x394ySi7hl_fYfY_K42VaHnHkBAYXVwZMcAXO0hOZtz0hIXSYPD3evbOjiklOFoTsWykqeyOVyd-TZuHKFu7UXa40X4AB9LHURZuptWt_ngGBvYeGo6p-YKl5KreciWzN6WwK1rqw0NyjV3QZmD88s3Q0kHfn7Y",
        "https://pix10.agoda.net/hotelImages/5817296/0/835eb8b2bf5880a4e9dc3e5bb7f0669e.jpg?s=1024x768",
        "https://d397xw3titc834.cloudfront.net/images/original/4/e6/4e64534b2d2f41b389eeb0fa7a880719.jpg",
        "https://resources.stuff.co.nz/content/dam/images/1/3/t/x/5/v/image.related.StuffLandscapeSixteenByNine.1420x800.1a6stp.png/1457204991167.jpg",
        "https://www.firetrainingcompany.co.uk/CPC/proxy/wp-content/uploads/sites/7/2019/11/hotels-fire-safety-training-1024x682.jpg",
        "https://static.seattletimes.com/wp-content/uploads/2019/01/01282019_hotel-upgrade_112654-780x501.jpg",
        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/bb/4c/08/suite-with-mountain-view.jpg?w=900&h=-1&s=1",
      ],
    }
  },
  computed: {
    getRoomsWithRandomImage() {
      if (this.rooms) {
        this.rooms.forEach((item) => {
          item.img = this.hotelRoom[
            Math.floor(Math.random() * this.hotelRoom.length)
          ]
        })
      }

      return this.rooms
    },
  },
  mounted() {
    //  this.setPage(this.hostel.name)
    this.getHostel()
  },
  methods: {
    ...mapActions("page", ["setPage"]),
    async getHostel() {
      const { data } = await this.$axios.get(
        `/connect/api.akado/v1/getRoom/${this.hostel.hostel_id}`
      )
      this.rooms = data || null
    },
  },
}
</script>
<style scoped>
.room-wrap {
  @apply grid grid-cols-1 place-items-start place-content-stretch w-full gap-y-8;
}

.room-wrap .room-item {
  @apply flex flex-col justify-start items-stretch w-full p-6;
}

.room-wrap .room-item .room-thumbnail {
  width: 100%;
  max-width: 16rem;
  position: relative;
  flex: 1 1 100%;
}

.room-wrap .room-item .room-thumbnail::after {
  display: block;
  content: "";
  padding-bottom: 56.25%;
}

.room-wrap .room-item .room-thumbnail img {
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  @apply object-cover rounded-md;
}

.room-wrap .room-item .room-content {
  flex: 1 1 10%;
  @apply grid grid-cols-1 gap-y-3 place-content-start place-items-start;
}

.room-wrap .room-item .room-content h1 {
  @apply text-2xl font-bold;
}

@screen md {
  .room-wrap .room-item .room-thumbnail {
    flex: 1 0 33.33%;
  }

  .room-wrap .room-item {
    @apply flex-row justify-start items-start;
  }
}
</style>
