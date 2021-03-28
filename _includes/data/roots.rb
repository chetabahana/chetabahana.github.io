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
{%- assign my_count = my_roots | find_exp:"item", "item.key < 2014" %}
{%- assign my_value = '' | split: ',' %}
{%- case myId %}
    {%- when 9 %}{%- assign my_debug = 100 -%}
    {%- when 13 %}{%- assign my_debug = 110 -%}
    {%- when 17 %}{%- assign my_debug = 101 -%}
    {%- when 68 -%}{%- assign my_debug = 78 -%}
{%- endcase -%}
{%- if my_debug %}{% assign my_pos = my_debug -%}
    {%- elsif myId >= 1 and myId <= 9 %}{%- assign my_debug = 97 | minus: myId -%}
    {%- elsif myId >= 10 and myId <= 28 %}{%- assign my_debug = myId | plus: 38 -%}
    {%- elsif myId >= 29 and myId <= 40 %}{%- assign my_debug = myId | plus: 8 -%}
    {%- elsif myId >= 41 and myId <= 50 %}{%- assign my_debug = myId | plus: 27 -%}
    {%- elsif myId >= 51 and myId <= 68 %}{%- assign my_debug = myId | plus: 72 -%}
    {%- elsif myId >= 69 and myId <= 77 %}{%- assign my_debug = 105 | minus: myId -%}
    {%- elsif myId >= 78 and myId <= 80 %}{%- assign my_debug = myId | minus: 53 -%}
    {%- elsif myId >= 81 and myId <= 85 %}{%- assign my_debug = myId | minus: 61 -%}
    {%- elsif myId >= 86 and myId <= 89 %}{%- assign my_debug = 93 | minus: myId -%}
    {%- elsif myId >= 90 and myId <= 92 %}{%- assign my_debug = myId | plus: 7 -%}
    {%- elsif myId >= 93 and myId <= 98 %}{%- assign my_debug = 106 | minus: myId -%}
    {%- elsif myId >= 99 and myId <= 104 %}{%- assign my_debug = myId | minus: 85 -%}
    {%- elsif myId >= 105 and myId <= 109 %}{%- assign my_debug = 194 | minus: myId -%}
    {%- elsif myId >= 110 and myId <= 114 %}{%- assign my_debug = myId | minus: 31 -%}
    {%- elsif myId >= 115 and myId <= 139 %}{%- assign my_debug = myId | minus: 114 -%}
    {%- elsif myId >= 140 and myId <= 149 %}{%- assign my_debug = myId | plus: 0 -%}
    {%- elsif myId >= 150 and myId <= 168 %}{%- assign my_debug = myId | plus: 0 -%}
{%- endif %}
{%- comment %}
*
*  Get the content
*
{%- endcomment %}
{%- if my_debug %}
    {%- assign my_pos = my_debug %}
    {%- assign my_debug = nil %}
{%- else %}
    {%- capture my_debug %}
        {{- content | strip -}}
    {%- endcapture %}
{%- endif %}
{%- assign values = my_roots[my_pos].val | split: ';' %}
{%- for value in values %}
    {%- assign my_val = value | times: 1 %}
    {%- assign my_value = my_value | push: my_val %}
{%- endfor %}
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
    *  Get the roots array if the position is one of the 29 frame
    *  The sequence is located on the range of 168 minus 29 as below:
    *  - seq 1 to 10 will turn to be leading at pos 150 up to 159
    *  - seq 11 to 19 will turn to be lagging at pos 168 down to 160
    *  - seq 21 to 29 will turn to be lagging at pos 149 down to 140
    *  - each of this seq 21 to 29 are attached to the seq of 11 to 19 
    *  - thus seq 1 to 10 live as single strand while 11 to 29 as double
    *
    {%- endcomment %}
    {%- if my_pos >= 140 and my_pos <= 149 %}{% assign my_fpos = 169 | minus: my_pos %}
    {%- elsif my_pos >= 150 and my_pos <= 159 %}{% assign my_fpos = my_pos | minus: 149 %}
    {%- elsif my_pos >= 160 and my_pos <= 168 %}{% assign my_fpos = 179 | minus: my_pos -%}
    {%- endif %}
    {%- comment -%}
    *
    *  You may see the running code here:
    *  https://chetabahana.github.io/feed.json
    *
    *  Reference:
    *  https://user-images.githubusercontent.com/36441664/112737922-eda4df80-8f90-11eb-9898-922e5798092a.gif
    *  https://user-images.githubusercontent.com/36441664/112738298-390cbd00-8f94-11eb-98aa-f40177769654.png
    *  https://user-images.githubusercontent.com/36441664/112737889-9acb2800-8f90-11eb-8b17-4b15a317a717.png
    *
    {%- endcomment -%}
    {%- assign my_root = nil %}
    {%- assign my_frame = nil %}
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
{%- comment -%}
*
*  Note:
*  Documentation is currently available in bahasa only
*  https://github.com/chetabahana/chetabahana.github.io/wiki/Jekyll-Liquid
*
{%- endcomment -%}