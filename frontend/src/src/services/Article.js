import { URI } from '../config'
import axios from 'axios'

export function getArticle(articleId) {
  return axios.get(URI + '/article/' + articleId)
}
