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

export function fetchMeta(id) {
  return request({
    url: '/api/admin/meta/' + id,
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

export function postMeta(data) {
  return request({
    url: '/api/admin/meta',
    method: 'post',
    data
  })
}

export function fetchUserSettings() {
  return request({
    url: '/api/admin/user/settings',
    method: 'get'
  })
}

export function postUserSettings(data) {
  return request({
    url: '/api/admin/user/settings',
    method: 'post',
    data
  })
}

export function fetchSiteSettings() {
  return request({
    url: '/api/admin/site/settings',
    method: 'get'
  })
}

export function postSiteSettings(data) {
  return request({
    url: '/api/admin/site/settings',
    method: 'post',
    data
  })
}
