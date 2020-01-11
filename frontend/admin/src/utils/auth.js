import Cookies from 'js-cookie'

const TokenKey = 'Admin-Token'
const CsrfTokenKey = 'Csrf-Token'

export function getToken() {
  return Cookies.get(TokenKey)
}

export function setToken(token) {
  return Cookies.set(TokenKey, token)
}

export function removeToken() {
  return Cookies.remove(TokenKey)
}

export function getCsrfToken() {
  return Cookies.get(CsrfTokenKey)
}

export function setCsrfToken(token) {
  return Cookies.set(CsrfTokenKey, token)
}

export function removeCsrfToken() {
  return Cookies.remove(CsrfTokenKey)
}
