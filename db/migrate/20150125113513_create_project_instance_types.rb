class CreateProjectInstanceTypes < ActiveRecord::Migration
  def change
    create_table :project_instance_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
