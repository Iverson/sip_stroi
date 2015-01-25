class CreateProjectInstances < ActiveRecord::Migration
  def change
    create_table :project_instances do |t|
      t.string :name
      t.float :price
      t.text :description

      t.belongs_to :project, index:true
      t.belongs_to :instance_type, index:true
      t.timestamps null: false
    end
  end
end
