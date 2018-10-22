<template>
  <div>
    <form>
        <div class="form-group">
          <label for="new-url">URL</label>
          <input type="url"
            v-model="url"
            id="new-url"
            class="form-control"
            placeholder="http://example.com" />
        </div>

        <button class="btn btn-primary" @click.prevent="createNewUrl">Add</button>
      </form>
    </div>
</template>

<script>
export default {
  data: function() {
    return {
      url: ''
    }
  },
  methods: {
    createNewUrl()
    {
      if(this.url) {
        this.$emit('urlAdded', this.url);
        this.url = '';
      }
    }
  }
};
</script>
