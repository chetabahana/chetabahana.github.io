{%- assign n = 0 %}
{%- assign my_keys = '' | split: ',' %}
{%- assign my_rows = '' | split: ',' %}
{%- assign my_node = '' | split: ',' %}
{%- assign my_nodes = '' | split: ',' %}
{%- for item in my_roots limit: my_pos %}
    {%- assign my_root = nil %}
    {%- assign my_frame = nil %}
    {%- assign size = item.pos | size | minus: 2 %}
    {%- assign my_nodes_pos = item.pos | slice: 0, size %}
    {%- if n < 139 %}
        {%- unless my_keys contains my_nodes_pos %}
            {%- assign my_rows = my_rows | push: forloop.index0 %}
            {%- assign my_keys = my_keys | push: my_nodes_pos %}
            {%- assign my_nodes = my_nodes | push: my_node %}
            {%- assign my_node = '' | split: ',' %}
        {%- endunless %}
    {%- else %}
        {%- comment %}{% endcomment %}{% assign my_debug = my_nodes %}
        {%- assign my_frame_pos = my_pos | minus: 139 %}
        {%- assign my_frame = my_nodes[my_frame_pos] %}
        {%- assign my_root = nil %}
        {%- break %}
    {%- endif %}
    {%- assign nodes = item.node | split: ';' %}
    {%- for node in nodes %}
        {%- assign n = n | plus: 1 %}
        {%- assign my_obj = node | times: 1 %}
        {%- assign my_node = my_node | push: my_obj %}
        {%- if n == my_pos %}
            {%- assign my_root = node | times: 1 %}
            {%- assign my_frame = nil %}
            {%- break %}
        {%- else -%}
            {%- continue %}
        {%- endif %}
    {%- endfor %}
    {%- if my_root %}{% break %}{% endif %}
{%- endfor -%}
