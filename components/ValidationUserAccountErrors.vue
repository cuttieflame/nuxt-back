<template>
  <div class="alert alert-danger" role="alert">
    <ul>
      <li v-for="(value,index) in validationErrors" :key="index">
        {{value}}
      </li>
    </ul>
  </div>
</template>
<script>
export default {
  props : ['errors'],
  computed : {
    validationErrors() {
      let errors = Object.values(this.errors)
      errors = errors.flat()
      return errors
    }
  }
}
</script>
