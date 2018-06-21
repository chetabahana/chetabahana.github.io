---
weight: 1
layout: null
---
{% assign my_page_layout = page.path | split: "/" | shift | pop | join: "/" | append: "/" | append: page.slug | downcase %}{% assign my_page_path = my_page_layout | append: "/" %}{% assign my_childs = assets | where_exp:"item", "item.layout == my_page_layout" | where_exp:"item", "item.path contains my_page_path" %}{{ my_page_layout }}{{ my_childs | inspect }}{{ my_page_path }}
