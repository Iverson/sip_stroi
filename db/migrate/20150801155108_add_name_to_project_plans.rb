class AddNameToProjectPlans < ActiveRecord::Migration
  def change
    add_column :project_plans, :name, :string
  end
end
