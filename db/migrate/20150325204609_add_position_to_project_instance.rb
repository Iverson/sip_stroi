class AddPositionToProjectInstance < ActiveRecord::Migration
  def change
    add_column :project_instances, :position, :integer, default: 1
  end
end
