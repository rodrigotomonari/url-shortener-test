<template>
  <div id="app">
    <main class="main">
      <div class="container">
        <div class="row">
          <div class="col">
            <h1>URL Shortener Code Test</h1>

            <new-shortened-url @urlAdded="newUrl"></new-shortened-url>

            <hr>

            <shortened-url-list :shortenedUrls="shortenedUrls"></shortened-url-list>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script>
import ShortenedUrlList from "./components/ShortenedUrlList.vue";
import NewShortenedUrl from "./components/NewShortenedUrl.vue";

export default {
  data: function() {
    return {
      shortenedUrls: []
    };
  },
  components: {
    ShortenedUrlList,
    NewShortenedUrl
  },
  methods: {
    newUrl(url) {
      this.$http.post('/', {url: url}).then(response => {
        this.shortenedUrls.push(response.body)
      })
    },
    loadUrls() {
      this.$http.get('/').then(response => {
        return response.json();
      }).then(data => {
        this.shortenedUrls = data
      })
    }
  },
  created() {
    this.loadUrls();
  }
};
</script>

<style scoped>
.main {
  padding-top: 30px;
}
</style>
