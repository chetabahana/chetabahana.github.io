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
{% endcomment %}{% include data.rb %}{% if data.items -%}
    {%- assign variable = data.items[0] %}{% assign my_tabs = 2 -%}{%- assign my_tab = '    ' -%}
    {%- capture my_tabs %}{% for i in (1..my_tabs) %}{{ my_tab }}{% endfor %}{% endcapture -%}
    {%- capture my_tabn %}
    {{ my_tabs }}{% endcapture -%}{{- my_tabs }}{
    {%- for items in variable %}
        {%- if items[1].first %}
            {%- for item in items %}
                {%- if forloop.first %}
                    {{- my_tabn }}{{ item | jsonify }}:
                {%- else %}
                    {%- for subitem in item %}
                        {{- my_tabn }}{{ my_tab }}{{ subitem[0] | jsonify}}: {{ subitem[1] | jsonify}}
                    {%- endfor %}
                {%- endif %}
            {%- endfor %}



        {%- else %}
            {{- my_tabn }}{{ items[0] | jsonify }}: {{ items[1] | jsonify }}
        {%- endif %}{% unless forloop.last %},{% endunless %}
    {%- endfor -%}
    {{- my_tabn }}}
{%- endif -%}