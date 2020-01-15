import request from '@/utils/request'

export function fetchList(query) {
  return request({
    url: '/api/admin/article/list',
    method: 'get',
    params: query
  })
}

export function fetchArticle(id) {
  return request({
    url: '/api/admin/article/' + id,
    method: 'get'
  })
}

export function fetchPv(pv) {
  return request({
    url: '/article/pv',
    method: 'get',
    params: { pv }
  })
}

export function createArticle(data) {
  return request({
    url: '/article/create',
    method: 'post',
    data
  })
}

export function updateArticle(data) {
  return request({
    url: '/article/update',
    method: 'post',
    data
  })
}

export function metas() {
  return request({
    url: '/api/admin/metas',
    method: 'get'
  })
}

export function postContent(data) {
  return request({
    url: '/api/admin/article',
    method: 'post',
    data
  })
}
