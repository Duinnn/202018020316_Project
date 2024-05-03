<template>
  <div id="home">
    <div class="menu">
      <div class="title">
        <img src="./logo.png" />
        Bill System
      </div>
      <el-menu
        :default-active="defaultMenu"
        class="el-menu-list"
        @select="handleSelect"
        background-color="#545c64"
        text-color="#fff"
        active-text-color="#ffd04b"
      >
        <el-menu-item index="1" @click="changeRoute('/system/accountManage')">
          <i class="el-icon-notebook-1"></i
          ><span slot="title">Bill Management</span></el-menu-item
        >
        <el-menu-item index="2" @click="changeRoute('/system/statistics')">
          <i class="el-icon-collection"></i><span slot="title">Bill Statistics</span>
        </el-menu-item>
        <el-menu-item index="4" @click="changeRoute('/system/consumeManage')"
          ><i class="el-icon-collection"></i
          ><span slot="title">Consumption Type</span></el-menu-item
        >
        <el-menu-item
          v-if="isAdmin"
          index="3"
          @click="changeRoute('/system/userManage')"
          ><i class="el-icon-user"></i
          ><span slot="title">User Management</span></el-menu-item
        >
      </el-menu>
    </div>
    <div class="wrap">
      <div class="otherInfo">
        <div
          :title="`Welcome,${name}`"
          style="margin-right: 10px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden"
        >
        Welcome,{{ name }}
        </div>
        <div style="display: flex; width: 50px">
          <el-dropdown @command="handleCommand">
            <span class="el-dropdown-link">
              <i
                class="el-icon-user"
                style="
                  font-size: 20px;
                  margin-right: 10px;
                  cursor: pointer;
                "
              ></i>
            </span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item command="editPassword"
                >Change Password</el-dropdown-item
              >
            </el-dropdown-menu>
          </el-dropdown>

          <i
            class="el-icon-switch-button"
            style="font-size: 20px; cursor: pointer; width: 150px"
            @click="loginOut('/login')"
            title="Exit"
          ></i>
        </div>
      </div>
      <div class="wrap-content" v-if="path.indexOf('statistics') > -1">
        <Statistics />
      </div>
      <div class="wrap-content" v-else-if="path.indexOf('userManage') > -1">
        <UserManage />
      </div>
      <div class="wrap-content" v-else-if="path.indexOf('accountManage') > -1">
        <AccountsManage />
      </div>
      <div class="wrap-content" v-else-if="path.indexOf('consumeManage') > -1">
        <ConsumeManage />
      </div>
    </div>
    <el-dialog
      title="Change Password"
      :visible.sync="dialogFormVisible"
      destroy-on-close
    >
      <el-form :model="form" ref="form" :rules="rules">
        <el-form-item
          label="Original Password"
          :label-width="formLabelWidth"
          prop="oldPassWord"
        >
          <el-input v-model="form.oldPassWord" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item
          label="New Password"
          :label-width="formLabelWidth"
          prop="password"
        >
          <el-input v-model="form.password" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item
          label="Confirm Password"
          :label-width="formLabelWidth"
          prop="confirmPassWord"
        >
          <el-input
            v-model="form.confirmPassWord"
            autocomplete="off"
          ></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">Cancel</el-button>
        <el-button type="primary" @click="editPassword('form')"
          >Confirm</el-button
        >
      </div>
    </el-dialog>
  </div>
</template>

<script>
import UserManage from '../UserManage/UserManage.vue'
import Statistics from '../Statistics/Statistics.vue'
import AccountsManage from '../AccountsManage/AccountsManage.vue'
import ConsumeManage from '../ConsumeManage/ConsumeManage.vue'
import { put } from '../../utils/http'
import { Message } from 'element-ui'

export default {
  name: 'Home',
  components: {
    UserManage,
    Statistics,
    AccountsManage,
    ConsumeManage,
  },
  mounted() {
    let router = {
      '#/system/accountManage': '1',
      '#/system/statistics': '2',
      '#/system/userManage': '3',
      '#/system/consumeManage': '4',
    }
    this.defaultMenu = router[window.location.hash]
    this.isAdmin = sessionStorage.getItem('isAdmin') == '1' ? true : false
  },
  data() {
    let path = window.location.hash
    let validatePassword = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('Please enter password'))
      } else {
        let reg = /^[a-zA-Z0-9]{8}$/
        if (!reg.test(value)) {
          callback(new Error('The password must consist of 8 letters and numbers, and cannot contain illegal characters!'))
        }

        callback()
      }
    }
    return {
      path,
      dialogFormVisible: false,
      passwordModalVisible: false,
      form: {
        oldPassWord: '',
        password: '',
        confirmPassWord: '',
      },
      rules: {
        oldPassWord: [
          { required: true, message: 'The original password cannot be empty', trigger: 'change' },
        ],
        password: [
          { required: true, message: 'The password cannot be empty' },
          { validator: validatePassword, trigger: 'change' },
        ],
        confirmPassWord: [
          { required: true, message: 'The confirm password cannot be empty' },
          { validator: validatePassword, trigger: 'change' },
        ],
      },
      formLabelWidth: '150px',
      name: sessionStorage.getItem('name'),
      isAdmin: false,
      defaultMenu: '1',
    }
  },
  mounter() {},
  methods: {
    handleSelect() {},
    changeRoute(path) {
      this.path = path
      this.$router.push({ path })
    },
    loginOut(path) {
      sessionStorage.clear()
      this.$router.push({ path })
    },
    handleCommand(command) {
      if (command === 'editPassword') {
        this.dialogFormVisible = true
      }
    },
    editPassword(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          put('/user/updateMyPsw', {
            name: sessionStorage.getItem('name'),
            oldPassword: this.form.oldPassWord,
            newPassword: this.form.password,
          }).then((res) => {
            if (res.description === 'success') {
              this.dialogFormVisible = false
              Message.success('Password modification successful')
            }
          })
        } else {
          return false
        }
      })
    },
  },
}
</script>
<style>
#home {
  height: 100%;
  display: flex;
}
.menu {
  width: 200px;
  background: rgba(84, 92, 100);
}
.el-menu {
  border-right: none;
}
.wrap {
  width: calc(100% - 200px);
}
.menu .title {
  display: flex;
  align-items: center;
  color: #fff;
  font-weight: 600;
  font-size: 20px;
  line-height: 60px;
  vertical-align: middle;
  animation: pro-layout-title-hide 0.3s;
  padding: 10px 0 0 10px;
}
.menu .title img {
  margin-right: 10px;
  width: 26px;
  height: 26px;
}
.otherInfo {
  display: flex;
  align-items: center;
  justify-content: flex-end;
  padding-right: 20px;
  box-shadow: 0 1px 4px rgb(0 21 41 / 8%);
  height: 61px;
}
.wrap-content {
  height: calc(100% - 121px);
  padding: 20px;
  overflow-y: auto;
}
</style>
