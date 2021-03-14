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
*  Addressing JSON object in Jekyll _data file
*  https://stackoverflow.com/a/55094996/4058484
*
{% endcomment %}{% include data.rb %}{%- if data.items -%}
{% assign my_tab = '    ' %}{{ my_tab }}{{ my_tab }}{
{%- for items in data.items[0] -%}
    {{ items[1].first }}:{% if items[1].first %}array{% else %}string{% endif %}
        {%- for item in items %}
        {{ item[1].first }}::{% if item[1].first %}array{% else %}string{% endif %}
        {%- for prop in item %}
            {{ prop | jsonify }}
        {%- endfor %}
    {%- endfor %}
{%- endfor %}
        }
{%- endif -%}
