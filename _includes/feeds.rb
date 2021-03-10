{%- comment -%}
*
*  get page for inclusion
*
{%- endcomment -%}
{%- if data == null -%}{%- include data.rb -%}{%- endif -%}
{%- if my_slug == null and my_feed.category != 'section' -%}{{ my_feed.content }}{%- endif -%}
{%- else -%}{%- include {{ my_feed.path | remove_first: "_" | replace: my_feed.ext, ".html" }} -%}{%- endif -%}
