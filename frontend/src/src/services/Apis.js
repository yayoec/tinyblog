import { URI } from '../config'
import axios from 'axios'

export function getArticle(articleId) {
  return axios.get(URI + '/api/article/' + articleId)
}

export function metas() {
  return axios.get(URI + '/api/metas')
}
