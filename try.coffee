---
# https://www.google.com/search?q=es2015+modules+coffeescript
# https://medium.com/@atilafassina/es2015-modules-101-d9977dc4d4c7*
---
 import './config.coffee'

CoffeeScript = require 'coffeescript'
eval CoffeeScript.compile 'console.log "Mmmmm, I could really go for some #{Math.pi}"'
