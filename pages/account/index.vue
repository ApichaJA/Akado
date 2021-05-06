<template>
  <section
    class="flex flex-col justify-start items-center my-24 w-full max-w-full px-4"
  >
    <div class="wrap-container user-card">
      <div class="user-track">
        <div class="profile-img">
          <img src="" />
        </div>
        {{ user }}
      </div>
    </div>
  </section>
</template>
<script>
import { mapGetters } from "vuex"

export default {
  middleware: "auth",
  async asyncData({ $http, $auth, redirect }) {
    const user = await $http.$get("/connect/auth/profile", {
      headers: {
        "Authorization": $auth.strategy.token.get(),
      },
    })

    if (user) {
        return { user }
    }

    return redirect('/')
  },
  computed: {
    ...mapGetters("user", ["getUser"]),
  },
}
</script>
<style scoped>
.user-card {
  @apply bg-blue-100 rounded-xl relative grid grid-cols-1 place-items-start;
}

.user-track {
  @apply relative p-6 flex flex-wrap justify-between items-center;
}

.user-track .profile-img {
  flex: 1 1 100%;
  @apply relative;
}

@screen lg {
  .user-track .profile-img {
    @apply absolute -left-8 -top-8;
  }
}
</style>
