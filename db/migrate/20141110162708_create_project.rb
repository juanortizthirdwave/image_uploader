class CreateProject < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.timestamps
    end

    create_table :images do |t|
      t.integer :gallery_id
      t.timestamps
    end
  end
end
