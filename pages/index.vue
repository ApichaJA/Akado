<template>
<section class=" max-w-7xl leading-snug mx-auto text-8xl font-bold flex flex-col space-y-8 justify-center items-center w-full min-h-screen text-gray-800 text-center">
<span>AKADO</span>
<small class="animate-pulse w-full text-gray-700 text-sm font-semibold">
  COMING SOON
</small>
</section>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  data() {
    return {
    }
  },
  computed: {
    ...mapGetters("hotels", ['getHotels'])
  }
  // methods:{
  //   pullHos(){
  //     this.hostel = this.$content
  //   }
  // }
}
</script>
