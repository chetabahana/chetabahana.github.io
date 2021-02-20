---
menus: ['abstrak', 'skema', 'eksekusi', 'portfolio', 'publikasi', 'network', 'diskusi']
---
{% comment %}
*
*  This layout loops through a collection called `feeds` and collect site data 
*  by page title and its category for inclusion to the sections output
*
*  You may see the running code here:
*  https://chetabahana.github.io/
*
{% endcomment %}{%- assign my_feed = page -%}{%- include feeds/section.rb -%}
