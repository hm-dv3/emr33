import json
def process(value):
  # Load the JSON string into a dictionary.
  data = json.loads(value)

  if data['__op'] == "d":
    data['ent_schema'] = ""
    data['ent_category'] = ""
    data['ent_column'] = ""
    data['ent_catalog'] = ""
    data['ent_table'] = ""
  else:
    json_entity=json.loads(data.get('entity'))
    json_keyvalue=json_entity.get("attributes") 
    
    # Convert to the JSON key:value string
    str_column="{"
    for each_row in json_keyvalue:
      str_column=str_column+'"'+each_row['key']+'":"'+each_row['value']+'",'
    str_column=str_column+'}'
    str_column=str_column.replace(',}','}')
    json_column=json.loads(str_column)
    
    # Add new field
    # data['cluster_id'] = "hk-prod"
    data['ent_schema'] = json_column.get("schema")
    data['ent_category'] = json_column.get("category")
    data['ent_column'] = json_column.get("column")
    data['ent_catalog'] = json_column.get("catalog")
    data['ent_table'] = json_column.get("table")
   
  # Serialize the data back to JSON.
  return json.dumps(data)
