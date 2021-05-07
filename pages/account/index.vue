<template>
  <section
    class="flex flex-col justify-start items-center my-24 space-y-12 w-full max-w-full px-4"
  >
    <div class="wrap-container user-card">
      <div class="user-track">
        <div class="profile-img">
          <img
            src="https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png"
          />
        </div>
        <div class="profile-meta space-y-4">
          <h1 class="acct-name capitalize text-secondary">
            {{ user.first_name }} {{ user.last_name }}
          </h1>
          <div
            class="flex items-start justify-between space-x-2 font-sans text-secondary"
          >
            <div class="meta-box">
              <b-icon icon="email" size="is-small"> </b-icon>&nbsp;{{
                user.email
              }}
            </div>
            <div class="meta-box">
              <b-icon icon="phone" size="is-small"> </b-icon>&nbsp;{{
                user.phone
              }}
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="wrap-container user-booking">
      <h1 class="text-secondary font-bold">Recently Booking</h1>
      <section v-if="bookingsList.length > 0">
        <client-only>
          <div
            class="columns my-5 col-box"
            v-for="(bookingsLists, index) in bookingsList"
            :key="index"
          >
            <div class="column p-0 is-4">
              <img
                :src="bookingsLists.image"
                style="border-radius: 7px 0 0 7px"
                width="300px"
                height="300px"
              />
            </div>
            <div class="column is-2">
              <span>ที่พัก {{ bookingsLists.hostel_name }}</span>
              <span>ราคา {{ bookingsLists.price }}</span>
              <span>จำกัด เพศ {{ bookingsLists.gender }}</span>
              <span class="mt-3">ที่อยู่ {{ bookingsLists.address }}</span>
            </div>
            <div class="column is-4">
              <span>วันที่เข้าพัก {{ bookingsLists.date_check_in }}</span>
              <span>วันที่ออกที่พัก {{ bookingsLists.date_check_out }}</span>
            </div>
          </div>
        </client-only>
      </section>
      <div v-else class="mx-auto mt-6 text-gray-500">
        - You're not booking any hostel -
      </div>
    </div>
  </section>
</template>
<script>
import { mapGetters } from "vuex"

export default {
  middleware: "auth",
  async asyncData({ $http, $auth, redirect, app }) {
    if (app.$auth.loggedIn) {
      const user = await $http.$get("/connect/auth/profile", {
        headers: {
          Authorization: $auth.strategy.token.get(),
        },
      })

      const bookingsList = await $http.$get("/connect/api.akado/v1/booking", {
        headers: {
          Authorization: $auth.strategy.token.get(),
        },
      })

      return { user, bookingsList }
    }

    return redirect("/login")
  },
  data() {
    return {
      bookings: null,
    }
  },
  computed: {
    ...mapGetters("user", ["getUser"]),
  },
}
</script>
<style scoped>
.user-card {
  @apply bg-blue-50 rounded-xl relative grid grid-cols-1 place-items-start gap-y-4;
}

.user-track {
  @apply relative p-6 flex flex-wrap justify-between items-start w-full;
}

.user-track .profile-img {
  flex: 1 1 100%;
  width: 8rem;
  @apply relative;
}

.user-track .profile-img img {
  @apply rounded-full;
}

.user-track .profile-meta {
  flex: 1 1 100%;
  @apply flex flex-col w-full;
}

.user-track .profile-meta .acct-name,
.user-track .profile-meta .meta-box {
  @apply text-lg text-center bg-white w-full font-bold p-2 rounded-xl;
}

.user-booking {
  @apply grid grid-cols-1 place-content-start place-items-start w-full gap-y-4;
}

@screen sm {
  .user-track .profile-meta {
    margin-left: 10rem;
  }
  .user-track .profile-img {
    width: 10rem;
    @apply absolute -left-2 -top-20;
  }
}

.col-box {
  border-radius: 10px 0 0 10px;
  cursor: pointer;
  border: 1px solid #343434;
}

.col-box:hover {
  color: white;
  background-color: #343434;
  transition: 0.5s;
}

.column span {
  display: block;
  width: 40vh;
}
</style>
