var merge = require('webpack-merge')
var prodEnv = require('./prod.env')

module.exports = merge(prodEnv, {
  NODE_ENV: '"development"',
  DEBUG_MODE: true,
  QUIZ_MASTER_API_HOST: '"http://localhost:3000/v1"'
  // QUIZ_MASTER_API_HOST: '"http://qm-api.ericturnerdev.com/v1"',
})
