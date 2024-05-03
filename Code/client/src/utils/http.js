import axios from 'axios'
import { Message } from 'element-ui'

axios.defaults.timeout = 200000000
axios.defaults.headers.post['Content-Type'] =
  'application/x-www-form-urlencoded;charset=UTF-8'

export function get(url, params) {
  return new Promise((resolve, reject) => {
    axios
      .get(url, {
        params: params,
      })
      .then((res) => {
        if (res.data.status == '200') {
          resolve(res.data)
        } else {
          Message.error({
            message: res.data.description || '连接异常，请刷新重试!',
          })
        }
      })
      .catch((err) => {
        reject(err.message)
      })
  })
}

export function post(url, params) {
  return new Promise((resolve, reject) => {
    axios
      .post(url, params)
      .then((res) => {
        if (res.data.status == '200') {
          resolve(res.data)
        } else {
          Message.error({
            message: res.data.description || '连接异常，请刷新重试!',
          })
        }
      })
      .catch((err) => {
        reject(err.data)
      })
  })
}

export function put(url, params) {
  return new Promise((resolve, reject) => {
    axios
      .put(url, params)
      .then((res) => {
        if (res.data.status == '200') {
          resolve(res.data)
        } else {
          Message.error({
            message: res.data.description || '连接异常，请刷新重试!',
          })
        }
      })
      .catch((err) => {
        reject(err.data)
      })
  })
}
