---
layout: default
---
{% comment %}
*
*  This redirects are performed by serving a data file with an HTTP-REFRESH
*  meta tag which configured via variable {{ page.redirect.from }}
*  Ref: https://github.com/jekyll/jekyll-redirect-from
*
*  You may see the running code here:
*  https://chetabahana.github.io/sequence.json
*
*  jekyll debug or print all variables
*  https://stackoverflow.com/q/34048313/4058484
*
{%- endcomment %}{% include data.rb %}{% if data.items -%}
{%- assign my_tabs = 2 %}{% assign my_tab = '    ' -%}
{%- for i in (1..my_tabs) %}{{ my_tab }}{% endfor %}{
{%- for items in data.items[0] -%}
        {%- if items[1].first %}
            {{ items[0] | jsonify }}: {

            }
        {%- else %}
            {{ items[0] | jsonify }}: {{ items[1] | jsonify -}}
        {%- endif -%}{% unless forloop.last %},{% endunless %}
{%- endfor %}
        }
{%- endif -%}
