import axios from 'axios'

export const http = axios.create({
  baseURL: '/api',
  timeout: 8000,
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
})

// Add request interceptor for debugging
http.interceptors.request.use(
  (config) => {
    console.log('HTTP Request:', {
      method: config.method,
      url: config.url,
      baseURL: config.baseURL,
      fullURL: `${config.baseURL || ''}${config.url || ''}`
    });
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

//web hook function, success handle and error handler
http.interceptors.response.use(
  (r) => r, // for the success
  (e) => { // for fail handling
    console.error('HTTP Error:', {
      status: e.response?.status,
      statusText: e.response?.statusText,
      data: e.response?.data,
      url: e.config?.url
    });
    return Promise.reject(e)
  }
)