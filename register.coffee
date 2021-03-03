---
# https://www.google.com/search?q=es2015+modules+coffeescript
# https://stackoverflow.com/questions/31606941/node-js-coffeescript-and-compiled-js-files
---
CoffeeScript = require 'coffeescript'
CoffeeScript.register()

require './src/main'
console.log(CoffeeScript)
