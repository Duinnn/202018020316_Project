<template>
  <div class="accounts-manage">
    <div class="accounts-manage-top">
      <div class="accounts-manage-top-line">
        <div class="accounts-manage-top-item">
          <span class="search-name">Keywords</span>
          <el-input
            style="width: 290px; margin-right: 20px"
            placeholder="Please Enter The Content"
            v-model="keyWords"
            @keyup.enter.native="searchList"
          >
            <el-button
              @click="searchList"
              slot="append"
              icon="el-icon-search"
            ></el-button>
          </el-input>
        </div>
        <div class="accounts-manage-top-item">
          <span class="search-name">Bill Type</span>
          <el-select
            style="width: 250px; margin-right: 20px"
            v-model="params.billType"
            placeholder="Please Select"
            @change="changeBillType"
          >
            <el-option
              v-for="item in billTypeOptions"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            >
            </el-option>
          </el-select>
        </div>
        <div class="accounts-manage-top-item">
          <el-date-picker
            v-model="date"
            class="date"
            type="datetimerange"
            range-separator="To"
            start-placeholder="Start Date"
            end-placeholder="End Date"
            @change="changeDate"
            value-format="yyyy-MM-dd HH:mm:ss"
          >
          </el-date-picker>
        </div>
      </div>
      <div class="accounts-manage-top-line">
        <div class="accounts-manage-top-item">
          <span class="search-name">Family Members</span>
          <el-select
            style="width: 290px; margin-right: 20px"
            v-model="params.userId"
            placeholder="Please Select"
            @change="changeUserId"
          >
            <el-option
              v-for="item in userList"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </div>
        <div
          class="accounts-manage-top-item"
          :style="this.params.billType === '1' ? 'display: none' : ''"
        >
          <span class="search-name">Consumption Type</span>
          <el-select
            style="width: 250px; margin-right: 20px"
            v-model="params.consumptionId"
            placeholder="Please Select"
            @change="changeConsumptionId"
          >
            <el-option
              v-for="item in allConsumeList"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            >
            </el-option>
          </el-select>
        </div>

        <el-button
          type="primary"
          @click="
            accountModalVisible = true
            modalTitle = 'Add Bill'
          "
          >Add Bill</el-button
        >
      </div>

      <el-dialog
        :title="modalTitle"
        :visible.sync="accountModalVisible"
        destroy-on-close
        @close="
          accountModalVisible = false
          form = {
            billType: '1',
            consumptionId: '',
            recordTime: '',
            money: '',
            remark: '',
          }
        "
      >
        <el-form :model="form" :rules="rules" ref="form">
          <el-form-item
            label="Bill Type"
            :label-width="formLabelWidth"
            prop="billType"
          >
            <el-radio v-model="form.billType" label="1">Expense</el-radio>
            <el-radio v-model="form.billType" label="2">Income</el-radio>
          </el-form-item>
          <el-form-item
            :style="form.billType === '2' ? 'display: none' : ''"
            label="Consumption Type"
            :label-width="formLabelWidth"
            prop="consumptionId"
          >
            <el-select
              style="width: 300px"
              v-model="form.consumptionId"
              placeholder="Please Select"
            >
              <el-option
                v-for="item in consumeList"
                :key="item.id"
                :label="item.name"
                :value="item.id"
              >
              </el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="Money" :label-width="formLabelWidth" prop="money">
            <el-input
              style="width: 300px"
              v-model="form.money"
              autocomplete="off"
            ></el-input>
          </el-form-item>
          <el-form-item
            label="Date"
            :label-width="formLabelWidth"
            prop="recordTime"
          >
            <el-date-picker
              v-model="form.recordTime"
              type="datetime"
              placeholder="Select Date"
              style="width: 300px"
              :picker-消费类型="pickerOptions"
            >
            </el-date-picker>
          </el-form-item>
          <el-form-item
            label="Notes"
            :label-width="formLabelWidth"
            prop="remark"
          >
            <el-input
              type="textarea"
              style="width: 300px"
              v-model="form.remark"
              autocomplete="off"
            ></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button
            @click="
              accountModalVisible = false
              form = {
                billType: '1',
                consumptionId: '',
                recordTime: new Date().toUTCString(),
                money: '',
                remark: '',
              }
            "
            >Cancel</el-button
          >
          <el-button type="primary" @click="addAccount('form')"
            >Confirm</el-button
          >
        </div>
      </el-dialog>
    </div>
    <div style="height: calc(100% - 80px)" v-loading="loading">
      <el-table
        class="accounts-manage-table"
        :data="tableData"
        style="width: 100%"
        :row-class-name="tableRowClassName"
      >
        <el-table-column prop="index" label="Order Number" width="160" type="index">
        </el-table-column>
        <el-table-column prop="userName" label="Bookkeeper" width="160"> </el-table-column>

        <el-table-column label="Bill Type">
          <template slot-scope="scope">
            {{ scope.row.billType === 2 ? 'Income' : 'Expense' }}
          </template>
        </el-table-column>
        <el-table-column prop="consumptionName" label="Consumption Type">
        </el-table-column>
        <el-table-column prop="money" label="Money"> </el-table-column>
        <el-table-column
          prop="recordTime"
          :formatter="formatterTime"
          label="Creation Time"
        >
        </el-table-column>
        <el-table-column prop="remark" label="Notes"> </el-table-column>
        <el-table-column label="Operation" width="100">
          <template slot-scope="scope">
            <el-button
              @click="editAccount(scope.row)"
              type="text"
              size="small"
              style="margin-right: 20px"
              >Edit</el-button
            >
            <el-popconfirm
              :title="`Are you sure to remove this bill?`"
              @confirm="deleteRow(scope.row)"
            >
              <el-button type="text" size="small" slot="reference"
                >Delete</el-button
              >
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>
      <div style="text-align: right; padding: 10px 0 10px 10px">
        <el-pagination
          style="padding: 0"
          background
          layout="prev, pager, next"
          :current-page="pageNum"
          :total="total"
          :page-size="pageSize"
          @current-change="handleCurrentChange"
        >
        </el-pagination>
      </div>
    </div>
  </div>
</template>

<script>
import { get, post, put } from '../../utils/http'
import moment from 'moment'
import { Message } from 'element-ui'

export default {
  name: 'AccountsManage',
  data() {
    let validateMoney = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('Please enter the amount'))
      } else {
        let reg = /^(([1-9][0-9]*)|(([0]\.\d{1,2}|[1-9][0-9]*\.\d{1,2})))$/
        if (!reg.test(value)) {
          callback(new Error('Amount is an integer or up to two decimal places'))
        }

        callback()
      }
    }
    return {
      accountModalVisible: false,
      tableData: [],
      billTypeOptions: [
        {
          value: '000000',
          label: 'Total',
        },
        {
          value: '2',
          label: 'Income',
        },
        {
          value: '1',
          label: 'Expense',
        },
      ],
      form: {
        billType: '1',
        consumptionId: '',
        recordTime: new Date().toUTCString(),
        money: '',
        remark: '',
      },
      rules: {
        billType: [
          { required: true, message: 'Consumption type cannot be empty', trigger: 'change' },
        ],
        money: [
          { required: true, message: 'The amount cannot be empty' },
          { validator: validateMoney, trigger: 'change' },
        ],
        consumptionId: [
          {
            required: this.billType === '1' ? true : false,
            message: 'Consumption type cannot be empty',
          },
        ],
        recordTime: [{ required: true, message: 'The date cannot be empty' }],
      },
      loading: false,
      formLabelWidth: '160px',
      keyWords: '',
      allConsumeList: [],
      consumeList: [],
      pageNum: 1,
      pageSize: 10,
      total: 0,
      params: {
        houseId: sessionStorage.getItem('houseId'),
        userId: '000000',
        consumptionId: '000000',
        billType: '000000',
        onlySelf: false,
      },
      date: [],
      modalTitle: 'Add Bill',
      selectId: '',
      userList: [],
      pickerOptions: {
        disabledDate(time) {
          return time.getTime() > Date.now()
        },
      },
    }
  },
  mounted() {
    this.getList()
    this.getUser()
    this.getConsumeList()
  },
  methods: {
    formatterTime(row, column, cellValue) {
      return moment(cellValue).format('YYYY-MM-DD HH:mm:ss')
    },
    getConsumeList() {
      get('/consumptionType/query', {
        houseId: this.params.houseId,
      }).then((res) => {
        this.loading = false
        if (res.description === 'success') {
          this.consumeList = JSON.parse(JSON.stringify(res.data))
          this.allConsumeList = JSON.parse(JSON.stringify(res.data))
          this.allConsumeList.unshift({
            id: '000000',
            name: 'Total',
          })
        }
      })
    },
    tableRowClassName({ rowIndex }) {
      if (rowIndex === 1) {
        return 'warning-row'
      } else if (rowIndex === 3) {
        return 'success-row'
      }
      return ''
    },
    addAccount(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          let params = {
            userId: sessionStorage.getItem('userId'),
            houseId: sessionStorage.getItem('houseId'),
            consumptionId: this.form.consumptionId,
            billType: this.form.billType,
            money: this.form.money,
            remark: this.form.remark,
            recordTime: moment(this.form.recordTime).format(
              'YYYY-MM-DD HH:mm:ss'
            ),
          }
          if (this.form.billType === '2') {
            params.consumptionId = 0
          }
          if (this.modalTitle === 'Edit Bill') {
            params.id = this.selectId
            put('/bill/update', params).then((res) => {
              if (res.description === 'success') {
                Message.success({ message: 'Successfully edited bill' })
                this.accountModalVisible = false
                this.pageNum = 1
                this.getList()
                this.form = {
                  billType: '1',
                  consumptionId: '',
                  recordTime: '',
                  money: '',
                  remark: '',
                }
              }
            })
          } else {
            post('/bill/add', params).then((res) => {
              if (res.description === 'success') {
                Message.success({ message: 'Successfully added bill' })
                this.accountModalVisible = false
                this.pageNum = 1
                this.getList()
              }
            })
          }
        } else {
          return false
        }
      })
    },
    getList() {
      this.loading = true
      let { userId, consumptionId, billType } = this.params
      if (userId === '000000') {
        userId = sessionStorage.getItem('userId')
      }
      if (consumptionId === '000000') {
        consumptionId = ''
      }
      if (billType === '000000') {
        billType = ''
      }
      get('/bill/query', {
        ...this.params,
        userId: userId,
        consumptionId,
        billType,
        pageNum: this.pageNum,
        pageSize: this.pageSize,
        remark: this.keyWords,
      }).then((res) => {
        this.loading = false
        if (res.description === 'success') {
          this.tableData = res.data.list
          this.total = res.data.total
        }
      })
    },
    handleCurrentChange(val) {
      this.pageNum = val
      this.getList()
    },
    changeBillType(type) {
      this.pageNum = 1
      if (type !== '0') {
        this.params.billType = type
      } else {
        delete this.params.billType
      }
      this.getList()
    },
    changeConsumptionId(id) {
      this.pageNum = 1
      if (id !== '0') {
        this.params.consumptionId = id
      } else {
        delete this.params.consumptionId
      }
      this.getList()
    },
    changeDate(date) {
      this.pageNum = 1
      if (date !== null) {
        this.params.beginDate = date[0]
        this.params.endDate = date[1]
      } else {
        delete this.params.beginDate
        delete this.params.endDate
      }
      this.getList()
    },
    changeUserId(userId) {
      this.pageNum = 1
      this.params.onlySelf = false
      if (userId === Number(sessionStorage.getItem('userId'))) {
        this.params.onlySelf = true
      }
      this.params.userId = userId
      this.getList()
    },
    editAccount(row) {
      this.modalTitle = 'Edit Bill'
      this.accountModalVisible = true
      this.form.billType = row.billType + ''
      this.form.consumptionId = row.consumptionId
      this.form.money = row.money
      this.form.recordTime = row.recordTime
      this.form.remark = row.remark
      this.selectId = row.id
    },
    deleteRow(row) {
      put('/bill/remove', { id: row.id }).then((res) => {
        if (res.description === 'success') {
          Message.success({ message: 'Successfully deleted bill' })
          this.pageNum = 1
          this.getList()
        }
      })
    },
    searchList() {
      this.pageNum = 1
      this.getList()
    },
    getUser() {
      get('/user/query', {
        houseId: sessionStorage.getItem('houseId'),
      }).then((res) => {
        if (res.description === 'success') {
          this.userList = res.data.list
          this.userList.unshift({
            id: '000000',
            name: 'Total',
          })
        }
      })
    },
  },
}
</script>

<style>
.accounts-manage-top-line {
  display: flex;
  padding: 0 0 20px 0;
}
.search-name {
  font-size: 14px;
  width: 90px;
}
.accounts-manage-top-item {
  display: flex;
  align-items: center;
  margin-right: 20px;
}
.accounts-manage-top-item:nth-last-child(1) {
  margin-right: 0;
}
.accounts-manage-top-item span {
  margin-right: 10px;
}
.el-table .warning-row {
  background: oldlace;
}

.el-table .success-row {
  background: #f0f9eb;
}
.accounts-manage-table {
  border: 1px solid #ebebeb;
}
.date {
}
</style>
