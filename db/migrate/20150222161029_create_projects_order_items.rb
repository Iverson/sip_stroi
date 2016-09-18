class CreateProjectsOrderItems < ActiveRecord::Migration
  def change
    create_table :projects_order_items do |t|
      t.string :name
      t.text :description
      t.float :price
      t.belongs_to :projects_order, index:true

      t.timestamps null: false
    end
  end
end
