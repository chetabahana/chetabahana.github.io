{%- comment -%}
*
*  get page for inclusion
*
{%- endcomment -%}
{%- if data == null -%}{%- include data.rb -%}{%- endif -%}
{%- if my_feed.category == null and my_slug == null %}{{ my_feed.content }}{%- else -%}
{%- include {{ my_feed.path | remove_first: "_" | replace: my_feed.ext, ".html" }} -%}{%- endif -%}
