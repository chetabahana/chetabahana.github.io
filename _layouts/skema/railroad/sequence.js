{% assign object_items = site.assets | where_exp:"item", "item.ext == 'coffee'" %}{{ object_path | inspect }}
