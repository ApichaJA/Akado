<template>
  <section>1222</section>
</template>
<script>
export default {
  middleware({ store, redirect }) {
    // If the user is not authenticated
    if (store.state.auth.loggedIn) {
      return redirect("/control")
    }
  },
}
</script>
