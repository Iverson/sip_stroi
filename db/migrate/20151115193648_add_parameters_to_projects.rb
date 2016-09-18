class AddParametersToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :dimensions, :string
    add_column :projects, :ceiling_height, :float
  end
end
