{% assign object_items = site.assets | where_exp:"item", "item.ext == '.coffee'" %}{% for item in object_items %}{{ item.output }}{% endfor %}
