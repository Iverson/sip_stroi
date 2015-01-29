class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :text
      t.attachment :image
      t.belongs_to :client, index:true

      t.timestamps null: false
    end
  end
end
