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
        {%- if forloop.first %}
            {{ prop | jsonify }}: {
        {%- else %}{{ prop.size | times: 1 }}-{{ prop | size | times: 2 }}-{{ prop[0].size | times: 3}}-{{ prop[0] | size | times: 4}}-{{ prop | jsonify | size | times: 5}}-{{ prop[0] | jsonify | size | times: 5}}
            {%- if prop | size == 1 %}
                {{ prop | jsonify }}
            {%- else %}
                {%- for subprop in prof %}
                    {{ subprop[0] | jsonify }}: {{ subprop[1] | jsonify }}{% unless forloop.last %},{% endunless %}
                {%- endfor %}
            {%- endif %}
            }
        {%- endif -%}
    {%- endfor %}{% unless forloop.last %},{% endunless %}
{%- endfor %}
        }
{%- endif -%}
