<template>
  <div>
    <div class="top">
      <div class="card">
        <div class="card-item">
          <div>
            Income<span>{{ allData.totalIncome }}</span>Dollar
          </div>
        </div>
        <div class="card-item">
          <div>
            Expense<span>{{ allData.totalExpend }}</span>Dollar
          </div>
        </div>
        <div class="card-item">
          <div>
            Balance<span>{{ allData.totalRemain }}</span>Dollar
          </div>
        </div>
        <!-- <div class="card-item">
          <div>Balance<span>{{ allData.totalBudget }}</span>Dollar</div>
        </div> -->
      </div>
      <div class="top-options">
        <el-select style="width: 290px; margin-right: 20px" v-model="userId" placeholder="Please select a family member"
          @change="changeUserId">
          <el-option v-for="item in userList" :key="item.id" :label="item.name" :value="item.id">
          </el-option>
        </el-select>
        <el-radio-group v-model="timeType" @change="changeTime">
          <el-radio-button label="1">This Month</el-radio-button>
          <el-radio-button label="2">Past Three Months</el-radio-button>
          <el-radio-button label="3">Past Six Months</el-radio-button>
          <el-radio-button label="4">Past Year</el-radio-button>
        </el-radio-group>
      </div>
    </div>

    <div style="display: flex">
      <div id="lineChart"></div>
      <div id="pieChart"></div>
    </div>
  </div>
</template>

<script>
import { get } from '../../utils/http'
export default {
  name: 'Statsitics',
  mounted() {
    this.getUser()
    this.changeTime()
    this.getPieData()
    console.log(this.pieData)
  },
  data() {
    return {
      timeType: '1',
      allData: {},
      lineData: {},
      pieData: [],
      userList: [],
      userId: '000000',
      onlySelf: false,
    }
  },
  methods: {
    drawLine() {
      // 基于准备好的dom，初始化echarts实例
      let myChart = this.$echarts.init(document.getElementById('lineChart'))
      // 绘制图表
      myChart.setOption({
        title: {
          text: 'Income and Expense Statistics',
        },
        tooltip: {
          trigger: 'axis',
        },
        legend: {
          data: ['Income', 'Expense'],
        },
        color: ['#CCCCFF', '#FFCCCC'],
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true,
        },
        toolbox: {
          feature: {
            saveAsImage: {},
          },
        },
        xAxis: {
          type: 'category',
          boundaryGap: false,
          data: this.lineData.dateList ? this.lineData.dateList : [],
          axisLine: {
            show: false,
          },
        },
        yAxis: {
          type: 'value',
          splitLine: {
            lineStyle: {
              type: 'dashed',
            },
          },
          axisLine: {
            show: false,
          },
          axisTick: {
            show: false,
          },
        },
        series: [
          {
            name: 'Income',
            type: 'line',
            stack: 'incomeStack',
            data: this.lineData.incomeList ? this.lineData.incomeList : [],
          },
          {
            name: 'Expense',
            type: 'line',
            stack: 'expenseStack',
            data: this.lineData.expendList ? this.lineData.expendList : [],
          },
        ],
      })
    },
    drawPie() {
      // 基于准备好的dom，初始化echarts实例
      let myChart = this.$echarts.init(document.getElementById('pieChart'))
      myChart.setOption({
        title: {
          text: 'Consumption Type',
        },
        tooltip: {
          trigger: 'item',
        },
        legend: {
          data: this.pieData.map((item) => item.name),
        },
        color: [
          '#85c7de',
          '#e7d8c9',
          '#CDB4DB',
          '#c9f2c7',
          '#FFC8DD',
          '#FFAFCC',
          '#BDE0FE',
          '#A2D2FF',
          '#FEC5BB',
          '#D8E2DC',
          '#B0C4B1',
          '#EAAC8B',
          '#88d498',
        ],
        series: [
          {
            name: 'Consumption Type',
            type: 'pie',
            radius: '65%',
            center: ['50%', '65%'],
            avoidLabelOverlap: false,
            itemStyle: {
              borderRadius: 10,
              borderColor: '#fff',
              borderWidth: 2,
            },
            label: {
              show: false,
              position: 'center',
            },
            labelLine: {
              show: false,
            },
            data: this.pieData,
          },
        ],
      })
    },
    getData() {
      get('/bill/statisticsByTime', {
        houseId: sessionStorage.getItem('houseId'),
        userId:
          this.userId === '000000'
            ? sessionStorage.getItem('userId')
            : this.userId,
        timeType: this.timeType,
        onlySelf: this.onlySelf,
      }).then((res) => {
        if (res.description === 'success') {
          this.allData = {
            totalIncome: res.data.totalIncome,
            totalExpend: res.data.totalExpend,
            totalBudget: res.data.totalBudget,
            totalRemain: (res.data.totalIncome - res.data.totalExpend).toFixed(
              2
            ),
          }
          console.log(this.allData.totalIncome)
          this.drawPie()
        }
      })
    },

    getLineData() {
      get('/bill/statisticsLineChart', {
        houseId: sessionStorage.getItem('houseId'),
        userId:
          this.userId === '000000'
            ? sessionStorage.getItem('userId')
            : this.userId,
        timeType: this.timeType,
        onlySelf: this.onlySelf,
      }).then((res) => {
        if (res.description === 'success') {
          Object.assign(this.lineData, res.data)
          this.drawLine()
        }
      })
    },

    getPieData() {
      get('/bill/statisticsType', {
        houseId: sessionStorage.getItem('houseId'),
        userId:
          this.userId === '000000'
            ? sessionStorage.getItem('userId')
            : this.userId,
        timeType: this.timeType,
        onlySelf: this.onlySelf,
      }).then((res) => {
        if (res.description === 'success') {
          if (res.data.length) {
            let newData = []
            res.data.forEach((element) => {
              newData.push({ name: element.name, value: element.money })
            })
            this.pieData = newData
            this.drawPie()
          }
        }
      })
    },
    
     changeTime() {
      this.getData();
      this.getLineData();
      this.getPieData();
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
    changeUserId(userId) {
      this.onlySelf = false
      if (userId === Number(sessionStorage.getItem('userId'))) {
        this.onlySelf = true
      }
      this.userId = userId
      this.changeTime()
    },
  },
}
</script>

<style>
.top {
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.top-options {
  display: flex;
  align-items: flex-end;
}

.card {
  display: flex;
  padding-bottom: 40px;
}

.card-item {
  display: flex;
  flex-direction: column;
  padding: 20px 30px;
  border: 1px solid #f0f0f0;
  box-shadow: 0 2px 12px 0 rgb(0 0 0 / 10%);
  border-radius: 6px;
  margin-right: 20px;
}

.card-item:nth-child(1) span {
  padding: 0 5px;
  color: #67c23a;
}

.card-item:nth-child(2) span {
  color: #e6a23c;
  padding: 0 5px;
}

.card-item:nth-child(3) span {
  color: #f56c6c;
  padding: 0 5px;
}

.card-item:nth-child(4) span {
  color: #909399;
  padding: 0 5px;
}

#lineChart {
  width: calc(50% - 40px);
  padding: 20px 20px;
  height: 400px;
}

#pieChart {
  width: calc(50% - 40px);
  padding: 20px 20px;
  height: 400px;
}
</style>
