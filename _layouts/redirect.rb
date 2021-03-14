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
*  Addressing JSON object in Jekyll _data file
*  https://stackoverflow.com/a/55094996/4058484
*
{% endcomment %}{% include data.rb %}{%- if data.items -%}
{% assign my_tab = '    ' %}{{ my_tab }}{{ my_tab }}{
{%- for item in data.items[0] -%}
    {%- for prop in item %}
            {{ prop | jsonify }}: {
            }
    {%- endfor %}
{%- endfor %}
        }
