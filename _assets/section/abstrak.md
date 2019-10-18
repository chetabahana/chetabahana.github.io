---
weight: 3
layout: assets/head
---
{% assign page_path = page.path | replace: "_assets/", "" | replace: ".md", ".html" %}{{ page_path }}