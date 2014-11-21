class RemoveImageIdFromFields < ActiveRecord::Migration
  def change
    remove_column :fields, :image_id, :integer
  end
end
