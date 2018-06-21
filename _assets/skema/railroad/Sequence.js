---
weight: 1
layout: null
---
{% assign my_page_layout = page.path | split: "/" | shift | pop | join: "/" | append: "/" | append: page.slug | downcase %}{% assign my_page_path = my_page_layout | append: "/" %}{% assign my_childs = assets | where_exp:"item", "item.layout == my_page_layout" | where_exp:"item", "item.path contains my_page_path" %}{% if my_childs.size > 0 %}{% capture my_childs_content %}{% for my_child in my_childs %}{{ my_child.output }}{% endfor %}{% endcapture %}{{ my_childs_content | jsonify }}{% else %}{% endif %}
