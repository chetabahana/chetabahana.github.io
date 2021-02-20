---
layout: default
---
{%- assign feed = site.feeds | where_exp:'item', 'item.redirect_from contains page.redirect.from' -%}
{%- assign my_feed = feed[0] %}{%- include feeds/section.rb -%}
