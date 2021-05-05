<template>
  <section>{{ this.$auth.user }}
      <button @click="$auth.logout('local')"> LOG OUT</button>
  </section>
</template>
<script>
export default {
  middleware: "auth",
}
</script>
