class CreateProjectBuildingPhotos < ActiveRecord::Migration
  def change
    create_table :project_building_photos do |t|
    	t.attachment :image
      t.belongs_to :project, index:true

      t.timestamps null: false
    end
  end
end
