<template>
  <li class="list-group-item">
    <a :href="shortenedUrl.short_url" target="_blank">{{ shortenedUrl.short_url }}</a>
    -
    {{ shortenedUrl.url }}
  </li>
</template>

<script>
export default {
  props: ['shortenedUrl']
};
</script>
