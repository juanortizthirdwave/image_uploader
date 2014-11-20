class AddFieldIdsToImage < ActiveRecord::Migration
  def change
    add_column :images, :field_ids, :text
  end
end
