class RenameColumnCustomAttributes < ActiveRecord::Migration
  def change
    rename_column :images, :custom_fields, :fields
  end
end
