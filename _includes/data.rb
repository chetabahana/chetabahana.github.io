{% comment %}
*
*  collect feed
*
{% endcomment %}{% if page.redirect.from %}{% assign my_slug = page.redirect.from | split: '/' | last | split: '.' | first | prepend: '/' %}{% assign feed = site.feeds | where_exp:'item', 'item.path contains my_slug' %}{% assign my_feed = feed[0] %}{% else %}{% assign my_feed = page %}{% endif %}{% comment %}
*
*  collect hash
*
{% endcomment %}{% assign my_data = site.data %}{% assign my_datas = '' | split: ',' %}{% assign my_hash = my_feed.path | remove_first: '_' | split: '/' | pop %}{% for hash in my_hash %}{% assign _hash = hash | prepend: '_' %}{% assign my_data = my_data[_hash] %}{% assign my_datas = my_datas | push: my_data %}{% endfor %}{% comment %}
*
*  collect data
*
{% endcomment %}{% for hashs in my_datas %}{% for hash in hashs %}{{hash[1].id}}{% if hash[1].id == my_feed.myId %}{% assign data = hash[1] %}{% endif %}{%- endfor -%}{%- endfor -%}
