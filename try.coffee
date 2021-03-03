---
# https://github.com/jashkenas/coffeescript/pull/3279
# https://www.google.com/search?q=require(%27coffeescript/register%27)
---
CoffeeScript.register()
eval CoffeeScript.compile 'console.log "Mmmmm, I could really go for some #{Math.pi}"'
