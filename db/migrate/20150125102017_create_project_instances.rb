class CreateProjectInstances < ActiveRecord::Migration
  def change
    create_table :project_instances do |t|
      t.string :name
      t.float :price
      t.text :description
      t.boolean :default, default: true

      t.belongs_to :project, index:true
      t.timestamps null: false
    end
  end
end
