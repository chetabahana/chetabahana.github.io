---
layout: feeds
permalink: /feed.json
---
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"weight": {{ my_asset.weight | jsonify }},
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"title": {{ my_asset.title | jsonify }},{% for item in my_asset sort_natural %}{% unless my_atributs contains item %} 
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}{{ item | jsonify }}: {{ my_asset[item] | jsonify }},{% endunless %}{% endfor %}
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"layout": {{ my_asset.layout | jsonify }},
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"path": {{ my_asset.path | jsonify }},
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"data": {% assign my_data = null %}{% assign my_input = null %}{% assign data = site.data %}{% assign my_hash = my_asset.path | remove_first: "_" | split: "/" | pop %}{% for hash in my_hash %}{% assign data = data[hash] %}{% endfor %}{% for hash in data %}{% if hash[1].title == my_asset.slug %}{% if hash[1].content %}{% assign my_input = hash[1].content %}{% assign my_data = my_hash | join: "." | prepend: 'site.data.' | append: '.' | append: my_asset.slug %}{% endif %}{% endif %}{% endfor %}{{ my_data | jsonify }},
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"input": {% if my_input %}{{ my_input | jsonify }}{% else %}{% include item.json %}{% assign my_childs_array = my_childs_output | replace: 'participant ', 'participant,' | replace: '--', '-' | replace: '>>', '>' | replace: '->', ',' | replace: ': ', ',' | replace: '\n', ',' | append: '@@@@' | replace: ',@@@@', '' | replace: '@@@@', '' | split: ',' %}{{ my_childs_array.first | jsonify }}{% endif %},
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"query": {% if my_asset.layout == my_skema %}{% capture my_query_output %}{% include assets/section/skema.json %}{% endcapture %}{{ my_query_output | jsonify }}{% else %}{% include item.json %}{% assign my_childs_array = my_childs_output | split: ',' %}{{ my_childs_array.first | jsonify }}{% endif %},
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"result": {% include item.json %}{% assign my_childs_array = my_childs_output | replace: 'participant ', 'participant,' | replace: '--', '-' | replace: '>>', '>' | replace: '->', ',' | replace: ': ', ',' | replace: '\n', ',' | append: '@@@@' | replace: ',@@@@', '' | replace: '@@@@', '' | split: ',' %}{{ my_childs_array.last | jsonify }},
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"output": {% include item.json %}{% assign my_childs_array = my_childs_output | replace: '--', '-' | replace: '>>', '>' | replace: '->', ',' | replace: ': ', ',' | replace: '\n', ',' | append: '@@@@' | replace: ',@@@@', '' | replace: '@@@@', '' | split: ',' | pop %}{{ my_childs_array.last | jsonify }},
{% assign my_index_size = my_index | size %}{% if my_index_size > 0 %}{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"items": [{% for index in my_index %}{{ my_captures[index] }}{% unless forloop.last %},{% endunless %}{% endfor %}
{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}]{% else %}{% for i in (1..my_size) %}{{ my_tab }}{% endfor %}{{ my_tab }}"items": []{% endif %}
