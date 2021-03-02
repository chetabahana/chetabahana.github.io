{%- comment -%}
*
*  Jekyll provides built-in support for Sass and can work with CoffeeScript via a Ruby gem.
*  https://jekyllrb.com/docs/assets/
*  https://coffeescript.org/#modules
*
*  You may see the running code here:
*  https://chetabahana.github.io/try.js
*
*  ES2015 modules are supported in CoffeeScript, with very similar import and export syntax:
*  https://coffeescript.org/v1/annotated-source/browser.html
*  https://github.com/chetabahana/grammar/blob/master/examples/implementation_languages/coffeescript/coffeescript_json.coffee
*
{%- endcomment =%}
import './local-file.coffee'
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
