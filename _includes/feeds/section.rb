{%- comment -%}
*
*  get page for inclusion
*
{%- endcomment -%}
{%- if data == null -%}{%- include data.rb -%}{%- endif -%}
{%- if page.redirect.from %}{% include {{ my_feed.path | remove_first: "_" | replace: ".md", ".html" }} -%}
{%- else %}{{ content }}{%- endif -%}
