<template>
  <section class="flex flex-col items-center my-20">
    <div class="columns">
      <div class="is-12 msg-box" id="chatBox">
        <div class="title">
          <span>MESSAGE</span>
        </div>
        <div class="chat-box ml-5">
          <h1 class="chatTitle">{{ nameHs }}</h1>
          <span>ROOM {{ roomId }}</span>
          <div
            class="chat-section mt-5"
            v-for="(chats, index) in chatLog"
            :key="index"
          >
            <div class="text-group-right mb-5" v-if="chats.role == 'member'">
              {{ user.first_name }} {{ user.last_name }}
              <b-icon icon="account" size="is-medium" class="icon"> </b-icon>
              <span class="ml-3 mt-2 px-5 py-2 text">{{ chats.message }}</span>
            </div>
            <div class="text-group-left mb-5" v-if="chats.role == 'admin'">
              <b-icon icon="account" size="is-medium" class="icon"></b-icon>
              {{ admin.first_name }} {{ admin.last_name }}
              <span class="ml-3 mt-2 px-5 py-2 text">{{ chats.message }}</span>
            </div>
          </div>
        </div>
        <div class="inp-message">
          <textarea
            v-model="message"
            name="message-to-send"
            id="message-to-send"
            :class="{ 'text-msg-inp animate-bounce': errorInput }"
            placeholder="Type your message"
            rows="3"
          ></textarea>
          <button
            @click="send()"
            class="btn px-5 py-3"
            style="background-color: #436358; color: white"
          >
            Send
          </button>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  middleware: "auth",
  data() {
    return {
      message: "",
      chatLog: [],
      roomId: 0,
      nameHs: "",
      admin: [],
      user: [],
      errorInput: false,
    }
  },
  async created() {
    const fetch = await this.$axios.get(
      `/connect/api.akado/v1/getChat/${this.$route.params.id}`
    )
    const admin = await this.$axios.get(
      `/connect/api.akado/v1/getUser/${fetch.data[0].admin_id}`
    )
    const user = await this.$axios.get(
      `/connect/api.akado/v1/getUser/${fetch.data[0].user_user_id}`
    )
    this.chatLog = fetch.data
    this.admin = admin.data[0]
    this.user = user.data[0]
    console.log(this.admin)
    this.nameHs = fetch.data[0].name
    this.roomId = fetch.data[0].id_chat_log

  },
  methods: {
    async send() {
      if (this.message.length > 1) {
        this.errorInput = false
        const data = {
          id_chat_log: 1,
          message: this.message,
        }
        await this.$axios.post("/connect/api.akado/v1/insertChat", { data })
        const fetch = await this.$axios.get(`/connect/api.akado/v1/getChat`)
        this.chatLog = fetch.data
        this.message = ""
      } else {
        this.errorInput = true
        setInterval(() => {
          this.errorInput = false
        }, 1500)
      }
    },
  },
  mounted() {
    
  },
  // async asyncData({ $auth, $http }) {
  //   const authToken = $auth.strategy.token.get()
  //   return { authToken }
  // },
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
.text-msg-inp {
  border: 2px solid red;
}
</style>
