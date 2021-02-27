{% comment %}
*
*  collect feed
*
{% endcomment %}{% if page.redirect.from %}{% assign feed = site.leads | where_exp:'item', 'item.redirect_from contains page.redirect.from' %}{% assign my_feed = feed[0] %}{% else %}{% assign my_feed = page %}{% endif %}{{ site.leads }}{% comment %}
*
*  collect property
*
{% endcomment %}{% assign items = "" | split: "," %}{% assign my_size = my_feed.path | split: '/' | size | plus:1 %}{% assign my_path = my_feed.path | split: '/' | pop | join: '/' | append: '/' | append: my_feed.slug | append: '/' %}{% assign feeds = site.feeds | sort: 'weight' | where_exp:'item', 'item.path contains my_path' %}{% for feed in feeds %}{% assign feed_size = feed.path | split: '/' | size %}{% if feed_size == my_size %}{% assign items = items | push:feed %}{% endif %}{% endfor %}{% comment %}
*
*  collect mathed data
*
{% endcomment %}{% assign data = null %}{% assign my_data = site.data %}{% assign my_hash = my_feed.path | split: '/' | pop %}{% for hash in my_hash %}{% if hash contains '_' %}{% assign my_data = my_data[hash] %}{% else %}{% assign _hash = hash | prepend: '_' %}{% assign my_data = my_data[_hash] %}{% endif %}{% endfor %}{% for hash in my_data %}{% if hash[1].title == my_feed.slug %}{% assign data = hash[1] %}{% endif %}{% endfor %}{%- assign my_tab = "    " -%}
