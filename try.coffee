---
layout: coffee
# https://www.google.com/search?q=es2015+modules+coffeescript
# https://medium.com/@atilafassina/es2015-modules-101-d9977dc4d4c7*
---
fs = require 'fs'

option '-o', '--output [DIR]', 'directory for compiled code'

task 'build:parser', 'rebuild the Jison parser', (options) ->
  require 'jison'
  code = require('./lib/grammar').parser.generate()
  dir  = options.output or 'lib'
  fs.writeFile "#{dir}/parser.js", code
