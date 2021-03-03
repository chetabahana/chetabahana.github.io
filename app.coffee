---
# https://coffeescript.org/#nodejs-usage
# https://github.com/jashkenas/coffeescript/blob/cc1b056b03a12ada575efdeb7b2a930f51eae33d/src/browser.coffee#L6
---
class MyModule

  myFunction : () ->
    console.log("debugging hello world!")

module.exports = MyModule
