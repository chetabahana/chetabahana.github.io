{% comment %}
*
*  This loop loops through all collection called `feeds` with category 'section'
*  and sorts it by the front matter variable 'weight' and than render
*  each of the {{ output }} with their own layout
*
*  You may see the running code here:
*  https://chetabahana.github.io/feed.json
*
{% endcomment %}{% if data == null %}{% include data.rb %}{% endif -%}
{%- if page.path != 'index.html' and page.ext != '.md' %}{
    {{ 'id' | jsonify }}: {% if data.id %}{{ data.id }}{% else %}{{ page.id }}{% endif %},
    {{ 'title' | jsonify }}: "{% if data.title %}{{ data.title | capitalize }} | {% endif %}Project Maps",
    {{ 'version' | jsonify }}: {{ 'https://jsonfeed.org/version/1.1' | jsonify }},
    {{ 'home_page_url' | jsonify }}: {{ '/' | absolute_url | jsonify }},
    {{ 'feed_url' | jsonify }}: {{ page.url | absolute_url | jsonify }},
    {{ 'description' | jsonify }}: {{ site.slogan | jsonify }},
    {{ 'user_comment' | jsonify }}: {{ 'This feed allows you to read the project mapping' | jsonify }},
    {{ 'items' | jsonify }}: [
{% endif %}}{% if page.path != 'index.html' and page.ext != '.md' %}{% if page.redirect.from %}{{ content }}{% endif %}
{{ my_tab }}]
}
{% else %}{% comment %}
*
*  render the main page 
*
{% endcomment %}{{ content }}{% endif %}