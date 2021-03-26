{%- comment -%}
*
*  This script is the implementation of Prime Mapping as being described on:
*  https://github.com/chetabahana/chetabahana.github.io/blob/Chetabahana/_layouts/feed.rb
*
*  Get the position of each Id:
*  https://github.com/chetabahana/hexagon/pull/2

*  Reference based on prime hexagon:
*  https://www.hexspin.com/defining-the-prime-hexagon/
*
{%- endcomment -%}
{%- assign my_debug = nil %}
{%- assign my_value = '' | split: ',' %}
{%- assign values = my_roots[myId].val | split: ';' %}
{%- for value in values %}
    {%- assign my_val = value | times: 1 %}
    {%- assign my_value = my_value | push: my_val %}
{%- endfor %}
{%- case myId %}
    {%- when 9 %}{%- assign my_debug = 100 -%}{%- comment -%}[23,2,1,1]{%- endcomment -%}
    {%- when 13 %}{%- assign my_debug = 110 -%}{%- comment -%}[41,2,1,1]{%- endcomment -%}
    {%- when 17 %}{%- assign my_debug = 101 -%}{%- comment -%}[59,4,1,1]{%- endcomment -%}
    {%- when 68 -%}{%- assign my_debug = 78 -%}{%- comment -%}[337,5,1,0]{%- endcomment -%}
    {%- when 105 %}{%- assign my_debug = 84 -%}{%- comment -%}[571,3,-1,1]{%- endcomment -%}
    {%- when 128 %}{%- assign my_debug = 67 -%}{%- comment -%}[719,0,-1,1]{%- endcomment -%}
    {%- when 139 %}{%- assign my_debug = 110 -%}{%- comment -%}[797,2,1,1]{%- endcomment -%}
{%- endcase -%}
{%- if my_debug %}{% assign my_pos = my_debug -%}
    {%- elsif myId >= 1 and myId <= 9 %}{%- assign my_debug = 97 | minus: myId -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 10 and myId <= 12 %}{%- assign my_debug = myId | plus: 39 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 14 and myId <= 16 %}{%- assign my_debug = myId | plus: 38 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 18 and myId <= 21 %}{%- assign my_debug = myId | plus: 38 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 22 and myId <= 28 %}{%- assign my_debug = myId | plus: 38 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 29 and myId <= 40 %}{%- assign my_debug = myId | plus: 8 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 41 and myId <= 50 %}{%- assign my_debug = myId | plus: 27 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 51 and myId <= 68 %}{%- assign my_debug = myId | plus: 72 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 69 and myId <= 77 %}{%- assign my_debug = 105 | minus: myId -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 78 and myId <= 80 %}{%- assign my_debug = myId | minus: 53 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 81 and myId <= 85 %}{%- assign my_debug = myId | minus: 61 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 86 and myId <= 89 %}{%- assign my_debug = 93 | minus: myId -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 90 and myId <= 92 %}{%- assign my_debug = myId | minus: 89 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 93 and myId <= 98 %}{%- assign my_debug = 106 | minus: myId -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 99 and myId <= 104 %}{%- assign my_debug = myId | minus: 85 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 105 and myId <= 109 %}{%- assign my_debug = 194 | minus: myId -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 110 and myId <= 114 %}{%- assign my_debug = myId | minus: 31 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 115 and myId <= 117 %}{%- assign my_debug = myId | minus: 18 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 118 and myId <= 120 %}{%- assign my_debug = myId | minus: 16 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 121 and myId <= 123 %}{%- assign my_debug = myId | minus: 14 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 124 and myId <= 127 %}{%- assign my_debug = myId | minus: 13 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 129 and myId <= 136 %}{%- assign my_debug = myId | minus: 14 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 137 and myId <= 138 %}{%- assign my_debug = myId | minus: 32 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 140 and myId <= 149 %}{%- assign my_debug = myId | plus: 0 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 150 and myId <= 154 %}{%- assign my_debug = myId | plus: 10 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 155 and myId <= 159 %}{%- assign my_debug = myId | plus: 0 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 160 and myId <= 164 %}{%- assign my_debug = myId | minus: 10 -%}{%- comment -%}{%- endcomment -%}
    {%- elsif myId >= 165 and myId <= 168 %}{%- assign my_debug = myId | plus: 0 -%}{%- comment -%}{%- endcomment -%}
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
    {%- endcapture %}
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