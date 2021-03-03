---
# https://www.google.com/search?q=es2015+modules+coffeescript
# https://www.google.com/search?q=require(%27coffeescript/register%27)
---
import './register.coffee'

CoffeeScript = require 'coffeescript'
eval CoffeeScript.compile 'console.log "Mmmmm, I could really go for some #{Math.pi}"'
