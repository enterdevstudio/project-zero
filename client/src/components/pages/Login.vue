<template>
  <app-content contentClass="login-page">
    <h1>{{ $t('pages.login.title') }}</h1>
    <login-form :on-success="onLoginSuccess" />
  </app-content>
</template>

<script>
import LoginForm from '../forms/Login'

export default {
  name: 'login-page',
  components: {
    LoginForm,
  },
  methods: {
    onLoginSuccess () {
      this.$router.push('/dashboard')
    },
  },
}
</script>
