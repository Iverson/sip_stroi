class CreateMeta < ActiveRecord::Migration
  def change
    create_table :meta do |t|
      t.string :title
      t.text :description
      t.string :keywords
      t.references :metable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
