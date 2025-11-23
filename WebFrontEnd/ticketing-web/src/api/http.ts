import axios from 'axios'

export const http = axios.create({
  baseURL: '/api',
  timeout: 8000,
})

//web hook function, success handle and error handler
http.interceptors.response.use(
  (r) => r, // for the success
  (e) => { // for fail handling
    return Promise.reject(e)
  }
)