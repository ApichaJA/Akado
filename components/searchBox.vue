<template>
  <form class="search-wrap">
    <div class="search-container gap-x-4">
      <div class="col-span-2 w-full grid grid-cols-1 gap-y-2">
        <label for="q">Where you want to rest?</label>
        <input
          id="q"
          type="text"
          placeholder="Find your best place"
          class="w-full"
          required
        />
      </div>

      <div class="btn-wrap col-span-2 mt-2">
        <button type="submit" class="w-full sm:w-auto">Search</button>
      </div>
    </div>
  </form>
</template>
<script>

</script>
<style scoped>
.search-wrap {
  @apply relative grid grid-cols-1 place-content-center place-items-center bg-gray-100 rounded-xl w-full max-w-full px-6 py-12;
}
.search-wrap .search-container {
  @apply grid grid-cols-2 gap-y-4 place-items-start place-content-stretch max-w-lg mx-auto w-full font-medium;
}

input {
  @apply rounded-xl py-2 px-4 font-medium border border-gray-200 border-solid;
}

input:focus,
input:active,
button:focus,
button:active {
  @apply outline-none ring-2 ring-offset-blue-300 ring-opacity-90;
}

label {
  @apply font-semibold text-gray-700;
}

.btn-wrap {
  @apply w-full;
}

.btn-wrap button {
  @apply px-12 py-2 bg-primary text-white text-lg rounded-xl block mx-auto font-semibold;
}
</style>
