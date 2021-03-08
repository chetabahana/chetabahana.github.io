---
myId: 156
key: 46
pos: 156
weight: 2
primes: 640
type: mapping
value: [911,4,-1,-2]
frame: [50,60,400,70,10,50]
object: [1,9,26,40,56,74,82,96]
permalink: /mapping.js
---
{% comment %}
*
*  Here we are defining The Document Object Model (DOM) with JavaScript
*  as the relations between their nodes with our feeds object.
*
*  You may see the reference of the code here:
*  https://chetabahana.github.io/mapping.js?t=1234
*
{%- endcomment -%}
{"data": {{ data[0] | jsonify }}}
{"roots": {{ my_roots | jsonify }}}
