class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.text :content
      t.attachment :image

      t.timestamps null: false
    end
  end
end
