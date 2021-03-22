{%- comment -%}
*
*  This script is the implementation of Prime Mapping as being described on:
*  https://github.com/chetabahana/chetabahana.github.io/blob/Chetabahana/_layouts/feed.rb
*
{%- endcomment -%}
{%- capture my_debug -%}
    {{- content | strip -}}
{%- endcapture -%}
{%- comment -%}
*
*  Get the position of each Id based on prime hexagon:
*  https://www.hexspin.com/defining-the-prime-hexagon/
*
{%- endcomment -%}
{%- case myId -%}
    {%- when myId > 0 and myId < 8 %}
        {%- assign my_debug = 97 | minus: myId -%}
    {%- when myId > 9 and myId < 28 %}
        {%- assign my_debug = 39 | plus: myId -%}
    {%- when myId > 29 and myId < 41 %}
        {%- assign my_debug = 8 | plus: myId -%}
    {%- when myId > 41 and myId < 51 %}
        {%- assign my_debug = 27 | plus: myId -%}
{%- endcase %}
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