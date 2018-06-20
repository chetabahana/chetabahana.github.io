{% assign object_items = site.assets | where_exp:"item", "item.ext == 'md'" %}{% for item in object_items %}{{ item.title }}{% endfor %}
