Images Uploader
===============

In this branch, our `Image` model has a `field_ids` array of id's of `Field` objects. This array is serialized and stored in the database. Therefore, the fields associated with our image can be tracked along the different versions of the object.

The field object will be created only if it doesn't exist, avoiding redundancy in the database.    
`@field = Field.where(name: "Custom Attribute 1", value: "custom value 1").first_or_create`
