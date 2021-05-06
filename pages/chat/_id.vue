<template>
  <section class="flex flex-col items-center my-20">
    <div class="columns">
      <div class="is-12 msg-box">
        <div class="title">MESSAGE</div>
        <div class="chat-box ml-5">
          <h1 class="chatTitle">Dusit Thani</h1>
          <div
            class="chat-section mt-5"
            v-for="(chats, index) in chat"
            :key="index"
          >
            <div class="text-group-right mb-5" v-if="chats.role == 'member'">
              <b-icon icon="account" size="is-medium" class="icon"> </b-icon>
              <span
                class="ml-3 mt-2 px-5 py-2 text">{{ chats.message }}</span
              >
            </div>
            <div class="text-group-left mb-5" v-if="chats.role == 'admin'">
              <b-icon icon="account" size="is-medium" class="icon"> </b-icon>
              <span
                class="ml-3 mt-2 px-5 py-2 text"
                >{{ chats.message }}</span
              >
            </div>
          </div>
        </div>
        <div class="inp-message">
          <textarea
            name="message-to-send"
            id="message-to-send"
            placeholder="Type your message"
            rows="3"
          ></textarea>
        </div>
      </div>
    </div>
  </section>
</template>
<script>
export default {
  middleware: "auth",
  data() {
    return {}
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
  async asyncData({ params, $http }) {
    const chat = await $http.$get(`/connect/api.akado/v1/getChat/${params.id}`)

    return { chat }
  },
}
</script>

<style scoped>
.msg-box {
  width: 80vh;
  background-color: whitesmoke;
  border-radius: 10px;
  height: 65vh;
  overflow-y: scroll;
  margin: 0;
  max-width: 800px;
}
.title {
  background-color: aquamarine;
  border-radius: 10px 10px 0 0;
  @apply bg-secondary p-3 font-semibold text-white text-center;
}

.chatTitle {
  text-decoration: underline;
  font-size: 3vh;
}

.text-group-left {
  max-width: 400px;
  overflow-wrap: break-word;
  align-items: center;
  text-align: left;
}

.text-group-right {
  max-width: 400px;
  overflow-wrap: break-word;
  align-items: center;
  text-align: right;
  margin-left: 34vh;
}

.icon {
  background-color: black;
  border-radius: 100px;
  padding: 1.5em;
  color: white;
}

.text {
  font-size: 1.2em;
  display: block;
  background-color: white;
  border-radius: 5px;
}

.inp-message {
  margin-top: 10vh;
  padding: 30px;
}

textarea {
  width: 100%;
  border: none;
  padding: 10px 20px;
  font: 14px/22px "Lato", Arial, sans-serif;
  margin-bottom: 10px;
  border-radius: 5px;
  resize: none;
}
</style>
