class CreateProjectPictures < ActiveRecord::Migration
  def change
    create_table :project_pictures do |t|
      t.string :name
      t.integer :project_id
      t.attachment :image
      t.text :description

      t.timestamps null: false
    end
  end
end
