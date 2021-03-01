---
layout: coffee
---
$ 'body'
.click (e) ->
  $ '.box'
  .fadeIn 'fast'
  .addClass 'show'
.css 'background', 'white'

screen =
  width: 1200
  ratio: 16/9

Object.defineProperty screen, 'height',
  get: ->
    this.width / this.ratio
  set: (val) ->
    this.width = val * this.ratio

class B extends A
  constructor: (arg) ->
    super arg
    @arg = arg

fs = require 'fs'

option '-o', '--output [DIR]', 'directory for compiled code'

task 'build:parser', 'rebuild the Jison parser', (options) ->
  require 'jison'
  code = require('./lib/grammar').parser.generate()
  dir  = options.output or 'lib'
  fs.writeFile "#{dir}/parser.js", code
