{%- comment -%}
*
*  get page for object inclusion
*  jekyll debug or print all variables
*
*  {"site": {{ site | jsonify | escape }}}
*  {"page": {{ page | jsonify | escape }}}
*  {"layout": {{ layout | jsonify | escape }}}
*  {"content": {{ content | jsonify | escape }}}
*  {"paginator": {{ paginator | jsonify | escape }}}
*
*  ref: 
*  https://docs.treepl.co/liquid
*  https://stackoverflow.com/a/53693728/4058484
*
{%- endcomment -%}
{%- if data.css and my_feed.ext == '.css' %}{%- include {{ data.css }} -%}
{%- elsif data.js and my_feed.ext == '.js' %}{%- include {{ data.js }} -%}
{%- elsif data.id and my_feed.ext == '.json' %}{
    {{ 'id' | jsonify }}: {% if data.id %}{{ data.id }}{% else %}{{ page.id }}{% endif %},
    {{ 'title' | jsonify }}: "{% if data.title %}{{ data.title | capitalize }} | {% endif %}Project Maps",
    {{ 'version' | jsonify }}: {{ 'https://jsonfeed.org/version/1.1' | jsonify }},
    {{ 'home_page_url' | jsonify }}: {{ '/' | absolute_url | jsonify }},
    {{ 'feed_url' | jsonify }}: {{ page.url | absolute_url | jsonify }},
    {{ 'description' | jsonify }}: {{ site.slogan | jsonify }},
    {{ 'user_comment' | jsonify }}: {{ 'This feed allows you to read the project mapping' | jsonify }},
    {{ 'items' | jsonify }}: [
        {{{ data.items | jsonify }}},
        {"test": {{ site.slogan | jsonify}}}
    ]
}
{%- else -%}{{ my_feed.content }}{% endif %}
