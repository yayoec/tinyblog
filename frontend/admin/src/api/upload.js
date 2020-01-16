import request from '@/utils/request'

export function myUpload(data) {
  console.log(data)
  return request({
    url: '/api/admin/upload', // 假地址 自行替换
    method: 'post',
    data
  })
}
