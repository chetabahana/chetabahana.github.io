---
entity: [2,8,3,33,60,4,99,57,47,13,55,76,65,98,59,24,22,63,58,49,66,64,61,62,48,5,9,110]
method: [13,16,18,21,23,25,28,30,32,34,36,38,40,42,45,47,49,51,53,55,57,59,61,63,65,67,69,71,73,75,77]
primes: [0,1,2,2,3,3,4,4,4,4,8,10,12,15,17,19,22,24,25,46,62,78,95,109,126,140,155,168,303,430,550,669,783,900,1007,1117,1229,2262,3245,4203,5133,6057,6935,7838,8713,9592,17984,25997,33860,41538,49098,56543,63951,71274,78498]
layers: [1,2,3,4,5,6,7,8,9,10,20,30,40,50,60,70,80,90,100,200,300,400,500,600,700,800,900,1000,2000,3000,4000,5000,6000,7000,8000,9000,10000,20000,30000,40000,50000,60000,70000,80000,90000,100000,200000,300000,400000,500000,600000,700000,800000,900000,1000000]
module: [5,87,89,92,112,55,39,88,113,51,52,53,96,72,54,70,50,69,44,45,73,103,74,102,42,47,48,49,85,84,57,75,90,58,43,41,56,38,59,60,61,62,63,64,65,66,95,111,106,34,67,76,23,37,97,46,94,105,101,91,109,110,104,108,99,107,77,2,78,79,71,40,3,4,31,98,33,80,81,24,7,82,86,83,27,36,8,68,10,35,26,9,11,12,28,1,25,100,93,14,30,16,13,32,19,29,17,15,18,114,6,22,20,21]
events: [96,68,73,74,1,111,81,87,92,89,93,94,103,100,108,102,107,109,105,113,114,112,53,80,97,91,85,95,106,101,75,104,77,50,90,86,54,38,7,72,36,25,35,19,20,56,26,27,28,17,10,11,12,15,6,37,31,34,39,40,41,42,43,44,45,46,51,88,18,16,71,14,21,23,32,52,67,69,70,78,79,82,84,30,29,83,2,8,3,33,60,4,99,57,47,13,55,76,65,98,59,24,22,63,58,49,66,64,61,62,48,5,9,110]
object: [2,60,40,1,30,30,5,1,30,200,8,40,50,1,30,200,8,10,40,1,30,8,40,4,30,30,5,200,2,1,30,70,30,40,10,50,1,30,200,8,40,50,1,30,200,8,10,40,40,30,20,10,6,40,1,30,4,10,50,1,10,1,20,50,70,2,4,6,1,10,1,20,50,60,400,70,10,50,1,5,4,50,1,1,30,90,200,9,1,30,40,60,400,100,10,40,90,200,9,1,30,700,10,50,1,50,70,40,400,70,30,10,5,40,1000,10,200,1,30,40,1000,800,6,2,70,30,10,5,40,6,30,1,1,30,800,1,30,10,50,102,66,329,289,83,65,202,231,329,289,90,56,95,32,126,38,640,61,330,681,299,791,561,155,1210,1879,155,37,922]
assets: [29,6116,3481,3747,2804,3050,3320,1233,2498,1833,1917,1777,853,830,655,1844,1556,1579,961,1335,1169,1274,1050,1316,893,1318,1151,1430,976,817,546,372,1287,883,775,725,861,733,1172,1219,794,860,830,346,488,643,539,560,347,373,360,312,360,342,351,379,574,472,445,348,221,175,180,241,287,249,333,300,258,217,226,285,199,255,164,243,181,173,179,133,104,80,169,107,109,61,72,92,137,82,54,71,40,27,34,72,30,94,36,40,36,28,14,33,23,17,25,10,26,19,23,15,23,20]
---
{% if data == null %}{% include data.rb %}{% endif -%}
{%- if page.path != 'index.html' and page.ext != '.md' %}{
    {{ 'id' | jsonify }}: {% if data.id %}{{ data.id }}{% else %}{{ page.id }}{% endif %},
    {{ 'title' | jsonify }}: "{% if data.title %}{{ data.title | capitalize }} | {% endif %}Project Maps",
    {{ 'version' | jsonify }}: {{ 'https://jsonfeed.org/version/1.1' | jsonify }},
    {{ 'home_page_url' | jsonify }}: {{ '/' | absolute_url | jsonify }},
    {{ 'feed_url' | jsonify }}: {{ page.url | absolute_url | jsonify }},
    {{ 'description' | jsonify }}: {{ site.slogan | jsonify }},
    {{ 'user_comment' | jsonify }}: {{ 'This feed allows you to read the project mapping' | jsonify }},
    {{ 'items' | jsonify }}: [
{% endif %}{% comment %}
*
*  assign the required variables
*
{% endcomment %}{% assign my_base = site.basedir %}{% assign my_atributs = 'id, key, link, weight, title, next, content, output, previous, redirect_from, relative_path, collection, excerpt, category, categories, ext, layout, tags, path, url, draft, slug, pos, myId, type, primes, value, object, frame, ratio, pairs, zones' | split:', ' %}{% assign my_tab = '    ' %}{% assign my_path = '' | split: ',' %}{% comment %}
*
*  get the maximum size of feeds
*
{% endcomment %}{% assign my_size = 1 %}{% assign feeds = site.feeds | sort:0 %}{% for feed in feeds %}{% assign my_split = feed.path | split: '/' %}{% assign size = my_split | size %}{% if size > my_size %}{% assign my_path = my_path | push: size %}{% assign my_size = size %}{% endif %}{% endfor %}{% comment %}
*
*  sort feeds base on weight (reversed order)
*
{% endcomment %}{% assign feeds = site.feeds | sort: 'weight' %}{% assign my_paths = '' | split: ',' %}{% for my_size in my_path reversed %}{% for feed in feeds %}{% assign my_dir = feed.path | split: '/' | pop | join: '/' %}{% unless my_dir == my_base %}{% assign my_split = feed.path | split: '/' %}{% assign size = my_split | size %}{% if size == my_size %}{% assign my_paths = my_paths | push: feed %}{% endif %}{% endunless %}{% endfor %}{% endfor %}{% comment %}
*
*  capture each outputs
*
{% endcomment %}{% assign my_captures = '' | split: ',' %}{% for feed in my_paths %}{% assign my_split = feed.path | split: '/' %}{% assign my_path_size = my_split | size %}{% assign my_part = my_split | size | minus: 2 %}{% assign my_size = my_split | size | times: 2 | minus: 2 %}{% assign my_dir = my_split[my_part] | prepend: '/' | append: '/' %}{% assign my_title = feed.title | downcase | prepend: my_dir | append: '/' %}{% assign my_index = '' | split: ',' %}{% for my_push in my_paths %}{% assign my_num = my_push.path | split: '/' | size | minus: my_path_size %}{% if my_num == 1 and my_push.path contains my_title %}{% assign my_index = my_index | push: forloop.index0 %}{% endif %}{% endfor %}{% comment %}
*
*  index the feeds output
*
{% endcomment %}{% capture my_capture %}
{% include items.rb %}{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}}{% endcapture %}{% assign my_captures = my_captures | push: my_capture %}{% endfor %}{% assign my_feeds = '' | split: ',' %}{% for feed in feeds %}{% assign my_dir = feed.path | split: '/' | pop | join: '/' %}{% if my_dir == my_base %}{% assign my_feeds = my_feeds | push: feed %}{% endif %}{% endfor %}{% for feed in my_feeds %}{% assign my_title = feed.title | downcase | prepend: '/' | prepend: my_base | append: '/' %}{% assign my_index = '' | split: ',' %}{% for my_path in my_paths %}{% assign my_split = my_path.path | split: '/' | size %}{% if my_split == 3 and my_path.path contains my_title %}{% assign my_index = my_index | push: forloop.index0 %}{% endif %}{% endfor %}{% assign my_size = 2 %}{% comment %}
*
*  render the feeds output
*  <pre>JSON.pretty_generate(@data)</pre>
*
{% endcomment %}{{ my_tab }}{{ my_tab }}}{% unless forloop.last %},
{% endunless %}{% endfor %}
{{ my_tab }}]
}
