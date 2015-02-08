class CreatePanels < ActiveRecord::Migration
  def change
    create_table :panels do |t|
      t.string :size
      t.string :material1
      t.string :material2
      t.string :material3
      t.float :price

      t.timestamps null: false
    end
  end
end
