{% comment %}
*
*  get page for inclusion
*
{% endcomment %}{% if my_feed.category %}{% include {{ my_feed.path | remove_first: "_" | replace: ".md", ".html" }} %}{% endif %}