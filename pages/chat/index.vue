<template>
  <section class="flex flex-col items-center my-20">
    <h1 v-if="chat">Chat</h1>
    <div class="card" v-for="(chatList, index) in chat" :key="index" @click="toChat(chatUID[0].user_user_id)">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <b-icon icon="account" size="is-medium" class="icon"> </b-icon>
            </figure>
          </div>
          <div class="media-content">
            <p class="title is-4">
              {{ chatList.first_name }} {{ chatList.last_name }}
            </p>
            <p class="subtitle is-6">{{ chatList.email }}</p>
          </div>
        </div>
      </div>
    </div>
    <div class="column"></div>
  </section>
</template>
<script>
export default {
  middleware: "auth",
  data() {
    return {
      uid: 0
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
    toChat(uid){
      this.$router.push(`chat/${uid}`)
    }
  },
  async asyncData({ $auth, $http }) {
    const chatUID = await $http.$get("/connect/api.akado/v1/getChatList", {
      headers: {
        Authorization: $auth.strategy.token.get(),
      },
    })
    const chat = await $http.$get(
      `/connect/api.akado/v1/getUser/${chatUID[0].admin_user_id}`
    )
    return { chat, chatUID }
  },
}
</script>


<style scope>
.card{
  cursor: pointer;
}
.card:hover{
  opacity: .5;
}
</style>
