class DropTableField < ActiveRecord::Migration
  def up
    drop_table :fields
  end

  def dowm
    create_table :fields do |t|
      t.string  :name
      t.string  :value
      t.integer :image_id
    end
  end
end
