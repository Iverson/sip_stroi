class AddNameToProjectBuildingPhotos < ActiveRecord::Migration
  def change
    add_column :project_building_photos, :name, :string
  end
end
