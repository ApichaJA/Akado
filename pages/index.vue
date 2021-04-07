<template>
<section class="animate-bounce max-w-7xl leading-snug mx-auto text-8xl font-bold flex flex-col space-y-8 justify-center items-center w-full min-h-screen text-gray-800 text-center">
<span class="animate-pulse">AKADO</span>
<small class="w-full animate-bounce text-gray-700 text-sm font-semibold">
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
