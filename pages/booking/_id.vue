<template>
  <section class="flex flex-col items-center my-20">
    <div class="book-detail">
      <!-- <div class="field flex info-box">
        <div class="control">
          <span class="info"> FIRST NAME </span>
        </div>
        <div class="control">
          <span class="info"> SUR NAME </span>
        </div>
      </div> -->
      <div class="field flex info-box">
        <div class="control">
          <span class="info"> ROOM TYPE: {{ room.type_name }} </span>
        </div>
        <div class="control">
          <span class="info"> 1 ROOM </span>
        </div>
      </div>
      <div class="field flex info-box">
        <div class="control">
          <span class="info"> CHECK IN </span>
          <input type="date" />
        </div>
        <div class="control">
          <span class="info"> CHECK OUT </span>
          <input type="date" />
        </div>
      </div>
      <div class="field info-box">
        <div class="control">
          <span class="info"> HOSTEL: {{ hostel.name }} </span>
        </div>
      </div>

      <div class="field info-box">
        <div class="control">
          <span class="info"> SEX {{ hostel.gender }} </span>
        </div>
      </div>
      <div class="field info-box">
        <div class="control">
          <span class="info"> PRICE: {{ room.price_month }} </span>
        </div>
      </div>
      <div class="field info-box" v-if="false">
        <div class="control">
          <span class="info"> CODE </span>
        </div>
      </div>
    </div>
    <div class="total my-4">
      TOTAL: {{ room.price_month + room.deposit }} BATH
    </div>
    <div class="btnBook"><button @click="booking()">BOOKING</button></div>
  </section>
</template>
<script>
export default {
  middleware: "auth",
  data() {
    return {
      hostel: [],
      room: [],
    }
  },
  async created() {
    const fetch = await this.$axios.get(
      `/connect/api.akado/v1/getRoom/${this.$route.params.id}`
    )
    const getHostel = await this.$axios.get(
      `/connect/api.akado/v1/getHostel/${fetch.data[0].hostel_hostel_id}`
    )
    this.hostel = getHostel.data
    this.room = fetch.data[0]
    console.log(this.hostel)
    console.log(this.room)
  },
  methods: {
    async login() {
      await this.$auth
        .loginWith("local", {
          data: { account: this.theForm },
        })
        .then(({ data }) => {
          // this.$auth.setUser(data.user)
          this.$store.dispatch("user/setUser", data.user)
        })
        .catch((err) => {
          console.log(err)
        })
    },
    async booking() {
      const data = {
        price: this.room.price_month,
        deposit: this.room.deposit,
        room_room_id: this.room.room_id,
      }
      await this.$axios.post("/connect/api.akado/v1/booking", { data })
    },
  },
}
</script>

<style scoped>
.total {
  width: 50vh;
  border-radius: 40px;
  @apply bg-secondary p-5 font-semibold text-white text-center;
}

.book-detail {
  border-radius: 40px;
  @apply bg-secondary p-10 font-semibold text-white;
}
.info-box {
  width: 50vh;
  margin-bottom: 3em;
  justify-content: space-between;
}
.btnBook {
  width: 50vh;
  border-radius: 40px;
  font-size: 5vh;
  @apply bg-secondary p-10 font-semibold text-white text-center;
}
</style>
