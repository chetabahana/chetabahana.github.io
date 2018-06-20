{% assign object_path = page.path | split: '/' | pop | pop | push: page.event | join: '/'  | append: '/' %}{{ object_path | inspect }}
