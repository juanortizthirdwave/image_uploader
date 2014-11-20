Images Uploader
===============

In this branch, our `Image` model has a `field_ids` array. This array stores the id's of `Field` objects associated with our image. This array is serialized and stored in the database. Therefore, the fields associated with our image can be tracked along the different versions of the object.  
```ruby
 create_table "images", force: true do |t|
    t.integer  "gallery_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.text     "field_ids"   # storing the id's of the associated fields
    
    # timestamps ...
  end
```

The field object will be created only if it doesn't exist, avoiding redundancy in the database.    
`@field = Field.where(name: "Custom Attribute 1", value: "custom value 1").first_or_create`  

The fields associated to an object can be accessed with the `fields` method:  
`image.fields   # [field1, field2, field3] `
