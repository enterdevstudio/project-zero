<template>
  <a v-if="isLink" href="#" @click.prevent="$emit('click')" class="list-item">
    <slot></slot>
  </a>
  <div v-else class="list-item">
    <slot></slot>
  </div>
</template>

<script>
  export default {

    name: 'list-item',

    computed: {
      isLink () {
        return !!this._events['click']
      }
    },

  }
</script>

<style>

  .list-item {
    display: block;
    padding: 10px 15px;

    line-height: 1.4rem;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;

    border: 1px solid transparent;
    border-radius: 4px;

    transition: all .1s ease-in-out;
  }
  a.list-item:hover {
    color: #000;
    text-decoration: none;

    background-color: #e2f4fb;
  }

</style>
