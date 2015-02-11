class CreatePanelsOrderItems < ActiveRecord::Migration
  def change
    create_table :panels_order_items do |t|
      t.string :size
      t.string :material
      t.integer :count, default: 0
      t.float :price
      t.belongs_to :panels_order, index:true

      t.timestamps null: false
    end
  end
end
