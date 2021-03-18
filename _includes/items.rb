{%- comment -%}
*
*  collect id
*
{%- endcomment -%}
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"id": {{ feed.myId | jsonify }},{% if feed.myId > 114 %}{% assign my_key = feed.myId | minus: 101 %}{% else %}{% assign my_key = feed.myId | minus: 1 %}{% endif %}
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"key": {{ layout.module[my_key] | jsonify }},
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"pos": {{ feed.pos | jsonify }},{% if feed.link %}
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"link": {{ feed.link | jsonify }},{% endif %}{% 
comment %}
*
*  collect primes
*
{% endcomment %}{% assign my_pos = feed.pos | minus: 1 %}{% include data/roots.rb %}
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"root": {{ my_root.val }},
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"count": {{ layout.object[my_pos] | jsonify }},
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"weight": {{ my_node | jsonify }},
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"title": {{ feed.title | jsonify }},
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"category": {{ feed.category | jsonify }},{% comment %}
*
*  other attributes
*
{% endcomment %}{% assign my_items = "" | split: "," %}{% for item in feed %}{% assign my_items = my_items | push:item %}{% endfor %}{% assign sorted_items = my_items | sort_natural %}{% for item in sorted_items %}{% unless my_atributs contains item %}
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}{{ item | jsonify }}: {{ feed[item] | jsonify }},{% endunless %}{% endfor %}
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"value": {{ feed.value | jsonify }},{% if feed.frame %}
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"frame": {{ feed.frame | jsonify }},{% endif %}
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"feeds": {{ feed.tags | jsonify }},{% if feed.ratio %}
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"ratio": {{ feed.ratio | jsonify }},{% endif %}
{% comment %}
*
*  collect all childs
*
{% endcomment %}{% assign my_index_size = my_index | size %}{% if my_index_size > 0 %}{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"items": [{% for index in my_index %}{{ my_captures[index] }}{% unless forloop.last %},{% endunless %}{% endfor %}
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}]{% else %}{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"items": []{% endif %}
