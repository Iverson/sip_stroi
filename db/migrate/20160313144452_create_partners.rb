class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.attachment :image
      t.string :url
      t.integer :position

      t.timestamps null: false
    end
  end
end
