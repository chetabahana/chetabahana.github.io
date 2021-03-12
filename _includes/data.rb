{% comment %}
*
*  collect feed
*
{% endcomment %}{% if page.redirect.from %}{% assign my_slug = page.redirect.from | split: '/' | last | split: '.' | first | prepend: '/' %}{% assign feed = site.feeds | where_exp:'item', 'item.path contains my_slug' %}{% assign my_feed = feed[0] %}{% else %}{% assign my_feed = page %}{% endif %}{% comment %}
*
*  collect property
*
{% endcomment %}{% assign my_size = my_feed.path | split: '/' | size | plus: 1 %}{% assign my_path = my_feed.path | split: '/' | pop | join: '/' | append: '/' | append: my_feed.slug | append: '/' %}{% assign feeds = site.feeds | sort: 'weight' | where_exp:'item', 'item.path contains my_path' %}{% for feed in feeds %}{% assign feed_size = feed.path | split: '/' | size %}{% endfor %}{% comment %}
*
*  collect mathed data
*
{% endcomment %}{% assign data = null %}{% assign my_data = site.data %}{% assign my_hash = my_feed.path | remove_first: "_" | split: '/' | pop %}{% for hash in my_hash %}{% assign my_data = my_data[hash] %}{% endfor %}{% for hash in my_data %}{% if hash[1].id == my_feed.slug %}{% assign data = hash[1] %}{% endif %}{% endfor %}
