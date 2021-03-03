---
# https://www.google.com/search?q=es2015+modules+coffeescript
# https://stackoverflow.com/questions/19716696/cant-require-local-coffeescript-modules
---
require 'coffee-script/register'
CoffeeScript = require 'coffee-script'

import 'coffee-script'
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
