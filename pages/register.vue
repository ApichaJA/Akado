<template>
  <section class="flex flex-col items-center my-24">
    <h1>Register</h1>
    <div class="box max-w-xl w-full p-6">
      <form class="grid grid-cols-1 gap-y-3" @submit.prevent="createUser">
        <b-field label="First name">
          <b-input
            v-model="theForm.fname"
            type="text"
            placeholder="First name"
            required
          >
          </b-input>
        </b-field>
        <b-field label="Last name">
          <b-input
            v-model="theForm.lname"
            type="text"
            placeholder="Last name"
            required
          >
          </b-input>
        </b-field>
        <b-field label="Phone">
          <b-input
            v-model="theForm.phone"
            type="text"
            placeholder="Phone"
            required
          >
          </b-input>
        </b-field>
        <b-field label="Email">
          <b-input
            v-model="theForm.email"
            type="email"
            placeholder="email * For login"
            required
          >
          </b-input>
        </b-field>

        <b-field label="Password">
          <b-input
            v-model="theForm.password"
            type="password"
            placeholder="password"
            password-reveal
            required
          >
          </b-input>
        </b-field>

        <b-button type="is-info" native-type="submit">Register</b-button>
      </form>
    </div>
  </section>
</template>
<script>
export default {
  data() {
    return {
      theForm: {
        fname: "",
        lname: "",
        phone: "",
        email: "",
        password: "",
      },
      duplicate: false
    }
  },
  methods: {
    async createUser() {
      const data = {
        first_name: this.theForm.fname,
        last_name: this.theForm.lname,
        email: this.theForm.email,
        phone: this.theForm.phone,
        password: this.theForm.password,
        type: "member",
      }
      const pushData = await this.$axios.post("/connect/api.akado/v1/createUser", { data })
        if(pushData.data.duplicate){
          alert(pushData.data.message)
        }
        else{
          this.$router.push('login')
        }
    },
  },

  middleware({ store, redirect }) {
    // If the user is not authenticated
    if (store.state.auth.loggedIn) {
      return redirect("/control")
    }
  },
}
</script>
