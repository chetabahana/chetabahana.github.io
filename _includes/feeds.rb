{%- comment -%}
*
*  get page for inclusion
*
{%- endcomment -%}
{%- include data.rb -%}
{%- if data.js %}{%- include {{ data.js }} -%}
{%- elsif my_slug -%}{%- include {{ my_feed.path | remove_first: "_" | replace: my_feed.ext, ".html" }} -%}
{%- elsif my_feed.category == 'section' %}{%- include {{ my_feed.path | remove_first: "_" | replace: my_feed.ext, ".html" }} -%}
{%- else -%}{{ my_feed.content }}{%- endif -%}
