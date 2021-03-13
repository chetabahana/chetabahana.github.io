---
layout: default
---
{% comment %}
*
*  This redirects are performed by serving an HTML file with an HTTP-REFRESH
*  meta tag which configured via variable {{ page.redirect.from }}
*
*  You may see the repository code here:
*  https://github.com/jekyll/jekyll-redirect-from
*
{%- endcomment -%}{%- assign my_tab = '    ' -%}{%- include data.rb -%}
{%- if data.items -%}{{ my_tab }}{{ my_tab }}{{ data.items[0] | jsonify }}{%- endif -%}
