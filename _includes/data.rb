{% comment %}
*
*  collect asset
*
{% endcomment %}{% assign my_assign = site.feeds %}{% if page.redirect.from %}{% assign my_assign = site.leads %}{% assign asset = my_assign | where_exp:'item', 'item.redirect_from contains page.redirect.from' %}{% assign my_asset = asset[0] %}{% else %}{% assign my_asset = page %}{% endif %}{% comment %}
*
*  collect property
*
{% endcomment %}{% assign items = "" | split: "," %}{% assign my_size = my_asset.path | split: '/' | size | plus:1 %}{% assign my_path = my_asset.path | split: '/' | pop | join: '/' | append: '/' | append: my_asset.slug | append: '/' %}{% assign assets = my_assign | sort: 'weight' | where_exp:'item', 'item.path contains my_path' %}{% for asset in assets %}{% assign asset_size = asset.path | split: '/' | size %}{% if asset_size == my_size %}{% assign items = items | push:asset %}{% endif %}{% endfor %}{% comment %}
*
*  collect mathed data
*
{% endcomment %}{% assign data = null %}{% assign my_data = site.data %}{% assign my_hash = my_asset.path | split: '/' | pop %}{% for hash in my_hash %}{% if hash contains '_' %}{% assign my_data = my_data[hash] %}{% else %}{% assign _hash = hash | prepend: '_' %}{% assign my_data = my_data[_hash] %}{% endif %}{% endfor %}{% for hash in my_data %}{% if hash[1].title == my_asset.slug %}{% assign data = hash[1] %}{% endif %}{% endfor %}{%- assign my_tab = "    " -%}
