{%- comment -%}
*
*  get page for inclusion
*
{%- endcomment -%}
{%- if data.js %}{%- include {{ data.js }} -%}
{%- elsif data.items -%}{{ my_tab }}{{ my_tab }}{{ data.items[0] | jsonify }}
{%- else -%}{{ my_feed.content }}{%- endif -%}
