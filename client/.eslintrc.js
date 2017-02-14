module.exports = {
  root: true,
  parser: 'babel-eslint',
  parserOptions: {
    sourceType: 'module'
  },
  extends: 'airbnb-base',
  // required to lint *.vue files
  plugins: [
    'html'
  ],
  // check if imports actually resolve
  'settings': {
    'import/resolver': {
      'webpack': {
        'config': 'build/webpack.base.conf.js'
      }
    }
  },
  'env': {
    'browser': true,
    'node': true,
  },
  // add your custom rules here
  'rules': {
    // don't require .vue extension when importing
    'import/extensions': ['error', 'always', {
      'js': 'never',
      'vue': 'never'
    }],
    // allow debugger during development
    'no-debugger': process.env.NODE_ENV === 'production' ? 2 : 0,
    // allow console logging during development
    'no-console': process.env.NODE_ENV === 'production' ? 2 : 0,
    // turn off due to bug when returning an object from arrow function
    'arrow-parens': 0,
    'arrow-body-style': 0,
    'quotes': 0,
    'prefer-template': 0,
    'no-restricted-syntax': 0,
  }
}
