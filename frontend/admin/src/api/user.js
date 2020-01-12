import request from '@/utils/request'
import axios from 'axios'

export function login(data) {
  return request({
    url: '/login?t=' + new Date().getTime(),
    method: 'post',
    data
  })
}

export function csrfToken() {
  axios.defaults.withCredentials = true
  return axios.get(process.env.VUE_APP_BASE_API + '/login', {
    headers: { accept: '*' }
  })
}

export function getInfo(token) {
  return request({
    url: '/api/user',
    method: 'get',
    params: { api_token: token }
  })
}

export function logout() {
  return request({
    url: '/logout',
    method: 'post'
  })
}
