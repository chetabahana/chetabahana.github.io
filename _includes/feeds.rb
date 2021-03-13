{%- comment -%}
*
*  get page for inclusion
*
{%- endcomment -%}
{%- if data.js %}{%- include {{ data.js }} -%}
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