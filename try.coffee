---
layout: coffee
# https://www.google.com/search?q=es2015+modules+coffeescript
# https://medium.com/@atilafassina/es2015-modules-101-d9977dc4d4c7*
---
require 'coffeescript/register'
App = require './app
import 'coffeescript'

import _ from 'underscore'
import * as underscore from 'underscore'

import { now } from 'underscore'
import { now as currentTimestamp } from 'underscore'
import { first, last } from 'underscore'
import utilityBelt, { each } from 'underscore'

export default Math
export square = (x) -> x * x
export class Mathematics
  least: (x, y) -> if x < y then x else y

export { sqrt }
export { sqrt as squareRoot }
export { Mathematics as default, sqrt as squareRoot }

export * from 'underscore'
export { max, min } from 'underscore'
