{%- comment -%}
*
*  This script is the implementation of Prime Mapping as being described on:
*  https://github.com/chetabahana/chetabahana.github.io/blob/Chetabahana/_layouts/feed.rb
*
{%- endcomment -%}
{%- capture my_content -%}
    {{- content | strip -}}
{%- endcapture -%}
{%- comment -%}
*
*  Get the position of each Id based on prime hexagon:
*  https://www.hexspin.com/defining-the-prime-hexagon/
*
{%- endcomment -%}
{%- assign my_debug = nil %}
{%- case myId -%}
    {%- when 9 %}{%- assign my_debug = 100 -%}
    {%- when 2 %}{%- assign my_debug = myId -%}
    {%- when 128 %}{%- assign my_debug = 67 -%}
{%- endcase -%}
{%- if my_debug -%}{%- assign my_pos = my_debug -%}
    {%- elsif myId > 68 and myId < 74 %}{%- assign my_debug = myId | minus: 38 -%}
    {%- elsif myId > 75 and myId < 78 %}{%- assign my_debug = 105 | minus: myId -%}
    {%- elsif myId > 77 and myId < 81 %}{%- assign my_debug = myId | minus: 53 -%}
    {%- elsif myId > 81 and myId < 86 %}{%- assign my_debug = myId | minus: 61 -%}
    {%- elsif myId > 89 and myId < 95 %}{%- assign my_debug = myId | minus: 89 -%}
    {%- elsif myId > 117 and myId < 121 %}{%- assign my_debug = myId | minus: 16 -%}
    {%- elsif myId > 114 and myId < 118 %}{%- assign my_debug = myId | minus: 18 -%}
    {%- elsif myId > 120 and myId < 124 %}{%- assign my_debug = myId | minus: 14 -%}
    {%- elsif myId > 123 and myId < 128 %}{%- assign my_debug = myId | minus: 13 -%}
    {%- elsif myId > 139 and myId < 149 %}{%- assign my_debug = myId | plus: 0 -%}
    {%- elsif myId > 149 and myId < 159 %}{%- assign my_debug = myId | plus: 10 -%}
    {%- elsif myId > 159 and myId < 162 %}{%- assign my_debug = myId | minus: 10 -%}
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