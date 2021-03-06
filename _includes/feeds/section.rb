{%- comment -%}
*
*  get page for inclusion
*
{%- endcomment -%}
{%- if data == null -%}{%- include data.rb -%}{%- endif -%}{{ my_feed | jsonify }}
{%- if my_feed.redirect.from == null %}{{ my_feed.content }}{%- else -%}
{%- include {{ my_feed.path | remove_first: "_" | replace: ".md", ".html" }} -%}{%- endif -%}
