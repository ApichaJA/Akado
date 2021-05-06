<template>
  <section class="flex flex-col items-center my-20">
      <div class="book-detail">
        <div class="field flex info-box">
          <div class="control">
            <span class="info">
                NAME
            </span>
          </div>
          <div class="control">
            <span class="info">
                SUR NAME
            </span>
          </div>
        </div>
        <div class="field flex info-box">
          <div class="control">
            <span class="info">
                ROOM TYPE
            </span>
          </div>
          <div class="control">
            <span class="info">
                1 ROOM
            </span>
          </div>
        </div>
        <div class="field flex info-box">
          <div class="control">
            <span class="info">
                CHECK IN
            </span>
          </div>
          <div class="control">
            <span class="info">
                CHECK OUT
            </span>
          </div>
        </div>
        <div class="field info-box">
          <div class="control">
            <span class="info">
                HOSTEL
            </span>
          </div>
        </div>

        <div class="field info-box">
          <div class="control">
            <span class="info">
                DETAIL
            </span>
          </div>
        </div>
        <div class="field info-box">
          <div class="control">
            <span class="info">
                PRICE
            </span>
          </div>
        </div>
        <div class="field info-box" v-if="false">
          <div class="control">
            <span class="info">
                CODE
            </span>
          </div>
        </div>
        </div>
        <div class="total my-4">
            TOTAL:
        </div>
        <div class="btnBook">
            BOOKING
        </div>
  </section>
</template>
<script>
export default {
  middleware: "auth",
  data() {
    return {
      theForm: {
        email: "",
        password: "",
      },
    }
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
  },
}
</script>

<style scoped>
.total{
    width: 50vh;
    border-radius: 40px;
    @apply bg-secondary p-5 font-semibold text-white text-center;
}

.book-detail{
    border-radius: 40px;
    @apply bg-secondary p-10 font-semibold text-white;
}
.info-box{
    width: 50vh;
    margin-bottom: 3em;
    justify-content: space-between;
}
.btnBook{
    width: 50vh;
    border-radius: 40px;
    font-size: 5vh;
    @apply bg-secondary p-10 font-semibold text-white text-center;
}
</style>