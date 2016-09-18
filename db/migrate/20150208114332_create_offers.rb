class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :name
      t.attachment :image
      t.text :description

      t.timestamps null: false
    end
  end
end
