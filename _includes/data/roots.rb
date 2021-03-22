{%- comment -%}
*
*  This script is the implementation of Prime Mapping as being described on:
*  https://github.com/chetabahana/chetabahana.github.io/blob/Chetabahana/_layouts/feed.rb
*
*  Get the position of each Id based on prime hexagon:
*  https://www.hexspin.com/defining-the-prime-hexagon/
*
{%- endcomment -%}
{%- assign my_debug = nil %}
{%- case myId -%}
    {%- when 9 %}{%- assign my_debug = 100 -%}
    {%- when 13 %}{%- assign my_debug = 110 -%}
    {%- when 17 %}{%- assign my_debug = 101 -%}
    {%- when 68 %}{%- assign my_debug = 78 -%}
    {%- when 128 %}{%- assign my_debug = 67 -%}
    {%- when 139 %}{%- assign my_debug = 110 -%}
{%- endcase -%}
{%- if my_debug %}{% assign my_pos = my_debug -%}
    {%- elsif myId >= 1 and myId <= 9 %}{%- assign my_debug = 97 | minus: myId -%}
    {%- elsif myId >= 10 and myId <= 12 %}{%- assign my_debug = myId | plus: 39 -%}
    {%- elsif myId >= 14 and myId <= 16 %}{%- assign my_debug = myId | plus: 38 -%}
    {%- elsif myId >= 18 and myId <= 21 %}{%- assign my_debug = myId | plus: 38 -%}
    {%- elsif myId >= 22 and myId <= 28 %}{%- assign my_debug = myId | plus: 38 -%}
    {%- elsif myId >= 29 and myId <= 40 %}{%- assign my_debug = myId | plus: 8 -%}
    {%- elsif myId >= 41 and myId <= 45 %}{%- assign my_debug = myId | plus: 27 -%}
    {%- elsif myId >= 46 and myId <= 50 %}{%- assign my_debug = myId | minus: 35 -%}
    {%- elsif myId >= 51 and myId <= 75 %}{%- assign my_debug = myId | minus: 72 -%}
    {%- elsif myId >= 76 and myId <= 77 %}{%- assign my_debug = 105 | minus: myId -%}
    {%- elsif myId >= 78 and myId <= 80 %}{%- assign my_debug = myId | minus: 53 -%}
    {%- elsif myId >= 81 and myId <= 85 %}{%- assign my_debug = myId | minus: 61 -%}
    {%- elsif myId >= 86 and myId <= 89 %}{%- assign my_debug = 93 | minus: myId -%}
    {%- elsif myId >= 90 and myId <= 92 %}{%- assign my_debug = myId | minus: 81 -%}
    {%- elsif myId >= 93 and myId <= 98 %}{%- assign my_debug = 106 | minus: myId -%}
    {%- elsif myId >= 99 and myId <= 104 %}{%- assign my_debug = myId | minus: 85 -%}
    {%- elsif myId >= 105 and myId <= 109 %}{%- assign my_debug = 194 | minus: myId -%}
    {%- elsif myId >= 110 and myId <= 114 %}{%- assign my_debug = myId | minus: 31 -%}
    {%- elsif myId >= 115 and myId <= 117 %}{%- assign my_debug = myId | minus: 18 -%}
    {%- elsif myId >= 118 and myId <= 120 %}{%- assign my_debug = myId | minus: 16 -%}
    {%- elsif myId >= 121 and myId <= 123 %}{%- assign my_debug = myId | minus: 14 -%}
    {%- elsif myId >= 124 and myId <= 127 %}{%- assign my_debug = myId | minus: 13 -%}
    {%- elsif myId >= 129 and myId <= 136 %}{%- assign my_debug = myId | minus: 14 -%}
    {%- elsif myId >= 137 and myId <= 138 %}{%- assign my_debug = myId | minus: 23 -%}
    {%- elsif myId >= 140 and myId <= 149 %}{%- assign my_debug = myId | plus: 0 -%}
    {%- elsif myId >= 150 and myId <= 154 %}{%- assign my_debug = myId | plus: 10 -%}
    {%- elsif myId >= 155 and myId <= 159 %}{%- assign my_debug = myId | plus: 0 -%}
    {%- elsif myId >= 160 and myId <= 164 %}{%- assign my_debug = myId | minus: 10 -%}
    {%- elsif myId >= 165 and myId <= 168 %}{%- assign my_debug = myId | plus: 0 -%}
{%- endif %}
{%- comment %}
*
*  Get the content
*
{%- endcomment %}
{%- if my_debug %}
    {%- if my_pos == my_debug %}
        {%- assign my_debug = nil %}
    {%- endif %}
{%- else %}
    {%- capture my_debug %}
        {{- content | strip -}}
    {%- endcapture -%}
{%- endif %}
{%- comment %}
*
*  Get the roots array
*
{%- endcomment %}
{%- assign n = 0 %}
{%- assign my_keys = '' | split: ',' %}
{%- assign my_rows = '' | split: ',' %}
{%- assign my_node = '' | split: ',' %}
{%- assign my_nodes = '' | split: ',' %}
{%- for item in my_roots limit: my_pos %}
    {%- comment -%}
    *
    *  Get the roots array if the position is a frame
    *
    {%- endcomment -%}
    {%- assign my_root = nil %}
    {%- assign my_frame = nil %}
    {%- assign my_fpos = my_pos | minus: 139 %}
    {%- assign size = item.pos | size | minus: 2 %}
    {%- assign my_nodes_pos = item.pos | slice: 0, size %}
    {%- if n <= 139 %}
        {%- unless my_keys contains my_nodes_pos %}
            {%- assign my_rows = my_rows | push: forloop.index0 %}
            {%- assign my_keys = my_keys | push: my_nodes_pos %}
            {%- assign my_nodes = my_nodes | push: my_node %}
            {%- assign my_node = '' | split: ',' %}
        {%- endunless %}
        {%- if n == 139 %}
            {%- assign my_frame = my_nodes[my_fpos] %}
        {%- endif %}
    {%- else %}
        {%- assign my_frame = my_nodes[my_fpos] %}
    {%- endif %}
    {%- if my_frame %}
        {%- assign my_root = nil %}
        {%- break %}
    {%- endif %}
    {%- comment -%}
    *
    *  Otherwise take the single root value
    *
    {%- endcomment -%}
    {%- assign nodes = item.node | split: ';' %}
    {%- for node in nodes %}
        {%- assign n = n | plus: 1 %}
        {%- assign my_obj = node | times: 1 %}
        {%- assign my_node = my_node | push: my_obj %}
        {%- if n != my_pos %}
            {%- continue %}
        {%- else -%}
            {%- assign my_root = node | times: 1 %}
            {%- break %}
        {%- endif %}
    {%- endfor %}
    {%- if my_root %}
        {%- assign my_frame = nil %}
        {%- break %}
    {%- endif %}
{%- endfor -%}