{% comment %}
*
*  get page for inclusion
*
{% endcomment %}{{ site.slogan | jsonify }}{% include data.rb %}{% if my_feed.category %}{% include {{ my_feed.path | remove_first: "_" | replace: ".md", ".html" }} %}{% endif %}