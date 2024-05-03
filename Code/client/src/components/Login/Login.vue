<template>
  <div id="login">
    <div class="login-title">Comprehensive Personal Expenses Tracking System</div> 
    <div class="login-content">
      <div class="login-form">
        <el-input placeholder="Please enter your account number" prefix-icon="el-icon-user" v-model="account"
          class="input-text">
        </el-input>
        <el-input placeholder="Please enter your password" prefix-icon="el-icon-lock" v-model="password" show-password
          class="input-text">
        </el-input>
        <el-row>
          <el-col :span="12">
            <el-button class="submit-button" type="primary" round v-on:click="login">Login</el-button>
          </el-col>
          <el-col :span="12">
            <el-button class="submit-button" round v-on:click="register">Register</el-button>
          </el-col>
        </el-row>
      </div>
    </div>
  </div>
</template>

<script>
import { post } from '../../utils/http'
import { Message } from 'element-ui'
export default {
  name: 'Login',
  data() {
    return {
      account: '',
      password: '',
    }
  },
  mounted() { },
  methods: {
    login: function () {
      if (this.account === '') {
        Message.error({ message: 'Account cannot be empty!' })
        return
      }
      if (this.password === '') {
        Message.error({ message: 'Password cannot be empty!' })
        return
      }
      post('/user/login', { name: this.account, password: this.password }).then(
        (res) => {
          if (res.description === 'success') {
            Message.success({ message: 'Successfully Login' })
            this.$router.push({ path: '/system/accountManage' })
            sessionStorage.setItem('userId', res.data[0].id)
            sessionStorage.setItem('houseId', res.data[0].houseId)
            sessionStorage.setItem('name', res.data[0].name)
            sessionStorage.setItem('isAdmin', res.data[0].isAdmin)
          }
        }
      )
    },
    register: function () {
      let namePattern = /^[a-zA-Z0-9_-]{2,16}$/
      let passwordPattern = /^[a-zA-Z0-9]{8}$/
      if (this.account === '') {
        Message.error({ message: 'Account cannot be empty!' })
        return
      }
      if (this.password === '') {
        Message.error({ message: 'Password cannot be empty!' })
        return
      }
      if (!namePattern.test(this.account)) {
        Message.error({
          message: 'The username must consist of 2-16 characters, letters, numbers, and underscores!',
        })
        return
      }
      if (!passwordPattern.test(this.password)) {
        Message.error({
          message: 'The password must consist of 8 letters and numbers, and cannot contain illegal characters!',
        })
        return
      }

      post('/user/register', {
        name: this.account,
        password: this.password,
        isAdmin: 1,
      }).then((res) => {
        if (res.description === 'success') {
          Message.success({ message: 'Successfully registered, please login' })
          this.account === ''
          this.password === ''
        }
      })
    },
  },
}
</script>

<style>
#login {
  height: 100%;
  background: url('https://cn.bing.com/th?id=OHR.MoonDogs_ZH-CN5201314184_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp') 50% 50% / cover;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.login-title {
   font-family: Arial, Helvetica, sans-serif;
  color: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 40px; 
  text-shadow: #000 1px 0 0, #000 0 1px 0, #000 -1px 0 0, #000 0 -1px 0;
}

.login-content {
  display: flex;
  justify-content: center;
  align-items: center;
}

.login-form {
  padding: 30px 60px 60px 60px;
  width: 400px;
}

.input-text {
  margin-bottom: 25px;
}

.submit-button {
  width: 96%;
}
</style>
