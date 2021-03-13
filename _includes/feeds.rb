{%- comment -%}
*
*  get page for inclusion
*
{%- endcomment -%}
{%- if data.js %}{%- include {{ data.js }} -%}
{%- elsif data.items -%}{{ my_tab }}{{ my_tab }}{{ data.items[0] | jsonify }}
{%- else -%}{{ my_feed.content }}{% endif %}{%- comment -%}
*
*  {"data": {{ site.data | jsonify }}}
*  {"pages": {{ site.pages | jsonify }}}
*  {"html": {{ site.html_pages | jsonify }}}
*  {"assets": {{ site.collections | jsonify }}}
*  {"files": {{ site.static_files | jsonify }}}
*  {"repos": {{ site.github.public_repositories | jsonify }}}
*
{%- endcomment -%}