<template>
  <section
    class="wrap-container mx-auto flex flex-col space-y-16 place-items-start w-full px-4 py-24"
  >
    <!-- <Hero :data="{ name: 'DUSIT THANI', address: 'Phuket, Thailand' }" /> -->

    <searchBox />

    <section class="slide-box space-y-4 max-w-full">
      <h1 class="section-headline">Recommended Hotels</h1>
      <client-only>
        <Slide :data="hotels" type="non-booking" />
      </client-only>
    </section>

    <section class="slide-box space-y-4 max-w-full">
      <h1 class="section-headline">Hot Deals</h1>
      <client-only>
        <Slide :data="hotels" type="non-booking" />
      </client-only>
    </section>
  </section>
</template>

<script>
import { mapActions } from "vuex"
/* eslint-disable */
export default {
  components: {
    Slide: () => import("@/components/postSlide"),
    searchBox: () => import("@/components/searchBox"),
    Hero: () => import("@/components/headlineHero"),
  },
  data() {
    return {
      hotels: null,
      hotelPics: [
        "https://cdn.justluxe.com/articles/images/news/15923463099999.jpg",
        "https://cf.bstatic.com/xdata/images/hotel/max500/218869009.jpg?k=5105a831ebd311cb91ba0d589d52e40cbccf21ea2085ca451ed00d0ed948dd69&o=",
        "https://photos.travelmyth.com/hotels/480/79/79293-897491.jpg",
        "https://www.incimages.com/uploaded_files/image/1920x1080/getty_503016934_204576.jpg",
        "https://mlbufqxx4mlc.i.optimole.com/NUlbwlo.9dVs~44fea/w:1080/h:675/q:auto/rt:fill/g:ce/https://tophotel.news/wp-content/uploads/2017/03/ways-final-1-1080x675.jpg",
        "https://wardandco.com/wp-content/uploads/2021/03/HOTEL-BLOG-1.jpg",
        "https://s3.eu-west-1.amazonaws.com/qms.assets.d3r.com/images/content_hero_780/10488-bangkok-16-hotel-the-authors-wing-dusk-01.jpg",
        "https://pix10.agoda.net/hotelImages/5817296/0/835eb8b2bf5880a4e9dc3e5bb7f0669e.jpg?s=1024x768",
        "https://i.pinimg.com/originals/c2/dc/8a/c2dc8a4403e0851261eae818c4874726.jpg",
        "https://thumbnails.expedia.com/V5g4oobrmCmFWxM_ii72t3HFdGQ=/500x333/smart/filters:quality(60)/exp.cdn-hotels.com/hotels/1000000/30000/22900/22883/120033e9_y.jpg",
        "https://photos.travelmyth.com/hotels/480/11/112045-716284.jpg",
        "https://static.seattletimes.com/wp-content/uploads/2019/01/01282019_hotel-upgrade_112654-780x501.jpg",
        "https://cdn.escapio.com/public/cache/hotel/plain-nowater/x/5431_viceroy_bali_33520946.jpg",
      ],
    }
  },
  created() {
    this.getHotels()
    this.setPage("K-DORM")
  },
  methods: {
    ...mapActions("page", ["setPage"]),
    async getHotels() {
      try {
        const { data } = await this.$axios.get(
          "/connect/api.akado/v1/getAllHostel"
        )

        if (data) {
          data.forEach(item => {
            item.img = this.hotelPics[
            Math.floor(Math.random() * this.hotelPics.length)
          ]
          });
        }

        this.hotels = data
      } catch (e) {
        console.error(e)
      }
    },
  },
}
</script>
<style scoped>

.slide-box {
  @apply flex flex-col;
}

.slide-box h1.section-headline {
  @apply font-bold;
}
</style>
