---
# https://www.google.com/search?q=es2015+modules+coffeescript
# https://stackoverflow.com/questions/19716696/cant-require-local-coffeescript-modules
---
require 'coffee-script/register'
CoffeeScript = require 'coffee-script'
eval CoffeeScript.compile 'console.log "Mmmmm, I could really go for some #{Math.pi}"'
