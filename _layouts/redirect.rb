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
*  
*
{% endcomment %}{% include data.rb %}{%- if data.items -%}
{% assign my_tab = '    ' %}{{ my_tab }}{{ my_tab }}{
{%- for items in data.items[0] -%}
        {%- if items[1].first %}
            {{ items[0] | jsonify | escape }}: {

            }
        {%- else %}
            {{ items[0] | jsonify  | escape }}: {{ items[1] | jsonify | escape -}}
        {%- endif -%}{% unless forloop.last %},{% endunless %}
{%- endfor %}
        }
{%- endif -%}
