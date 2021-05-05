<template>
  <section class="flex flex-col items-center my-24">
    <div class="box max-w-xl w-full p-6">
      <form class="grid grid-cols-1 gap-y-3" @submit.prevent="login">
        {{ $auth.loggedIn }}
        {{ $auth.token }}
        <b-field label="Email">
          <b-input
            v-model="theForm.email"
            type="email"
            placeholder="Your email"
            required
          >
          </b-input>
        </b-field>

        <b-field label="Password">
          <b-input
            v-model="theForm.password"
            type="password"
            placeholder="Your password"
            password-reveal
            required
          >
          </b-input>
        </b-field>

        <b-button type="is-info" native-type="submit">LOGIN</b-button>
      </form>
    </div>
  </section>
</template>
<script>
export default {
  data() {
    return {
      theForm: {
        email: "",
        password: "",
      },
    }
  },
  middleware: "auth",
  methods: {
    async login() {
      await this.$auth
        .loginWith("local", {
          data: { account: this.theForm },
        })
        .catch((err) => {
          console.log(err)
        })
    },
  },
}
</script>
