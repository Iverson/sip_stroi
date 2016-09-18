class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name
      t.string :phone
      t.text :message

      t.timestamps null: false
    end
  end
end
