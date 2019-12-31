import URI from '../config';

export async function getArticle(articleId) {
  return axios.get(URI + '/article/{articleId}');
} 