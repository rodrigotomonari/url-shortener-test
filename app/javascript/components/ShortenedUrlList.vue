<template>
  <div>
      <h2>Storaged URLs</h2>

      <p v-if="shortenedUrls.length == 0">No URL available</p>

      <ul class="list-group">
        <shortened-url v-for="shortenedUrl in shortenedUrls"
          v-bind:key="shortenedUrl.short_url"
          :shortenedUrl="shortenedUrl"></shortened-url>
      </ul>
  </div>
</template>
<script>
import ShortenedUrl from "./ShortenedUrl.vue";

export default {
  props: ["shortenedUrls"],
  components: {
    ShortenedUrl
  }
};
</script>
