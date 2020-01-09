import { URI } from '../config'
import axios from 'axios'

export function getArticle(articleId) {
  return axios.get(URI + '/api/article/' + articleId)
}

export function metas() {
  return axios.get(URI + '/api/metas')
}

export function metaArticles(metaId) {
  return axios.get(URI + '/api/meta/articles/' + metaId)
}

export function archives() {
  return axios.get(URI + '/api/archive/dates')
}

export function articles() {
  return axios.get(URI + '/api/articles')
}
