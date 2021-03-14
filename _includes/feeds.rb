{%- comment -%}
*
*  get page for inclusion
*
{%- endcomment -%}
{%- if data.js %}{%- include {{ data.js }} -%}
{%- else -%}{{ my_feed.content }}{% endif %}{%- comment -%}
*
*  {"site": {{ site | jsonify | escape }}}
*  {"page": {{ page | jsonify | escape }}}
*  {"layout": {{ layout | jsonify | escape }}}
*  {"content": {{ content | jsonify | escape }}}
*  {"paginator": {{ paginator | jsonify | escape }}}
*
*  ref: https://stackoverflow.com/a/53693728/4058484
*
{%- endcomment -%}
