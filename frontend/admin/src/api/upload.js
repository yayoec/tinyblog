import axios from 'axios'
import store from '@/store'
import { getToken, getCsrfToken } from '@/utils/auth'

const headers = {}

if (store.getters.token) {
  // let each request carry token
  // ['X-Token'] is a custom headers key
  // please modify it according to the actual situation
  headers.Authorization = 'Bearer ' + getToken()
}
headers['X-CSRF-TOKEN'] = getCsrfToken()
headers['Content-type'] = 'multipart/form-data'

const service = axios.create({
  baseURL: process.env.VUE_APP_BASE_API,
  withCredentials: true,
  timeout: 5000,
  headers: headers
})

export function myUpload(content) {
  var form = new FormData()
  form.append('file', content.file)
  return service.post('/api/admin/upload', form).then((res) => {
    return res.data
  })
}
