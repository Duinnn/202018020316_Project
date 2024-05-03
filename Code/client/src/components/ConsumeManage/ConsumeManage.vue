<template>
  <div class="consume-manage">
    <div class="consume-manage-top">
      <el-button type="primary" @click="dialogFormVisible = true"
        >Add new consumption type</el-button
      >
      <el-dialog
        title="Add new consumption type"
        :visible.sync="dialogFormVisible"
        destroy-on-close
      >
        <el-form :model="form" :rules="rules" ref="form">
          <el-form-item
            label="Consumption Type Name"
            :label-width="formLabelWidth"
            prop="name"
          >
            <el-input v-model="form.name" autocomplete="off"></el-input>
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogFormVisible = false">Cancel</el-button>
          <el-button type="primary" @click="addConsume('form')"
            >Confirm</el-button
          >
        </div>
      </el-dialog>
    </div>
    <div class="consume-manage-content" v-loading="loading">
      <el-table
        class="user-manage-table"
        :data="tableData"
        style="width: 100%"
        :row-class-name="tableRowClassName"
      >
        <el-table-column prop="index" label="Order Number" type="index" width="180">
        </el-table-column>
        <el-table-column prop="name" label="Type Name" width="180">
        </el-table-column>
        <el-table-column
          prop="createTime"
          :formatter="formatterTime"
          label="Creation Time"
        >
        </el-table-column>
        <el-table-column label="Operation" width="200">
          <template slot-scope="scope">
            <el-button
              type="text"
              size="small"
              slot="reference"
              @click="editConsumption(scope.row)"
              >Edit</el-button
            >
            <el-popconfirm
              v-if="scope.row.isCustom !== 0"
              :title="`Are you sure to delete${scope.row.name}type?`"
              @confirm="deleteRow(scope.row)"
            >
              <el-button
                type="text"
                size="small"
                slot="reference"
                style="margin-left:20px"
                >Delete</el-button
              >
            </el-popconfirm>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script>
import { get, put, post } from '../../utils/http'
import moment from 'moment'
import { Message } from 'element-ui'

export default {
  name: 'ConsumeManage',
  mounted() {
    this.getList()
  },
  data() {
    return {
      dialogFormVisible: false,
      rules: {
        name: [
          {
            required: true,
            message: 'The consumption type name cannot be empty',
            trigger: 'change',
          },
        ],
      },
      form: {
        name: '',
      },
      formLabelWidth: '180px',
      loading: false,
      params: {
        houseId: sessionStorage.getItem('houseId'),
      },
      tableData: [],
      modalTitle: 'Add new consumption type',
      selected: '',
    }
  },
  methods: {
    formatterTime(row, column, cellValue) {
      return moment(cellValue).format('YYYY-MM-DD HH:mm:ss')
    },
    tableRowClassName({ rowIndex }) {
      if (rowIndex === 1) {
        return 'warning-row'
      } else if (rowIndex === 3) {
        return 'success-row'
      }
      return ''
    },
    getList() {
      this.loading = true
      get('/consumptionType/query', {
        ...this.params,
      }).then((res) => {
        this.loading = false
        if (res.description === 'success') {
          this.tableData = res.data
        }
      })
    },
    addConsume(form) {
      this.$refs[form].validate((valid) => {
        if (valid) {
          let params = {
            name: this.form.name,
            houseId: sessionStorage.getItem('houseId'),
          }
          if (this.modalTitle === 'Edit Consumption Type') {
            params.id = this.selected
            params.newName = this.form.name
            delete params.name
            put('/consumptionType/updateName', params).then((res) => {
              if (res.description === 'success') {
                Message.success({ message: 'Successfully edited consumption type' })
                this.dialogFormVisible = false
                this.getList()
              }
            })
          } else {
            post('/consumptionType/add', params).then((res) => {
              if (res.description === 'success') {
                Message.success({ message: 'Successfully added new consumption type' })
                this.dialogFormVisible = false
                this.getList()
              }
            })
          }
        } else {
          return false
        }
      })
    },
    deleteRow(row) {
      put('/consumptionType/deleteType', { id: row.id }).then((res) => {
        if (res.description === 'success') {
          Message.success({ message: 'Successfully deleted consumption type' })

          this.getList()
        }
      })
    },
    editConsumption(row) {
      this.modalTitle = 'Edit Consumption Type'
      this.dialogFormVisible = true
      this.form.name = row.name
      this.selected = row.id
    },
  },
}
</script>

<style>
.consume-manage {
  height: calc(100% - 30px);
}
.consume-manage-top {
  display: flex;
  justify-content: flex-end;
  padding-bottom: 15px;
}
.consume-manage-content {
  height: calc(100% - 55px);
}
</style>
