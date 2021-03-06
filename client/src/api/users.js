import { get, post } from './http'

export default {
  register: (email) => {
    return post('/api/users', { email }, false)
  },

  activate: (token, username, password) => {
    const url = `/api/users/${token}/activate`
    const payload = {
      user: {
        username,
        password,
      },
    }
    return post(url, payload, false)
  },

  login: (username, password) => {
    const payload = {
      username,
      password,
    }
    return post('/api/users/authorize', payload, false)
  },

  getCurrent: () => {
    return get('/api/users/me')
  },
}
