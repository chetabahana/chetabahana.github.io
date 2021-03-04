---
# https://stackoverflow.com/questions/17729871/node-js-coffeescript-issues-with-requiring-modules
# http://nickdesaulniers.github.io/blog/2013/08/28/making-great-node-dot-js-modules-with-coffeescript/
---
require 'coffee-script/register'
console.log(CoffeeScript)

App = require './app'
console.log(App)
