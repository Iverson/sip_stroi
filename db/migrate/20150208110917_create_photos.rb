class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.attachment :image

      t.timestamps null: false
    end
  end
end
