class AddCustomFieldsToImage < ActiveRecord::Migration
  def change
    add_column :images, :custom_fields, :text
  end
end
