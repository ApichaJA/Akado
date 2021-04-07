<template>
  <section>
    Hello, world!
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
