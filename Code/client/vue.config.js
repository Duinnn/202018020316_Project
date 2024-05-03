module.exports = {
  devServer: {
    // https: false,
    // hotOnly: false,
    port: 8088,
    // 跨域
    proxy: {
      '/user': {
        target: 'http://localhost:8888',
        changeOrigin: true,
        // pathRewrite:{
        //     '^/api':''
        //   }
      },
      '/bill': {
        target: 'http://localhost:8888',
        changeOrigin: true,
        // pathRewrite:{
        //     '^/api':''
        //   }
      },
      '/consumptionType': {
        target: 'http://localhost:8888',
        changeOrigin: true,
        pathRewrite: {
          '^/api': '',
        },
      },
    },
  },
}
