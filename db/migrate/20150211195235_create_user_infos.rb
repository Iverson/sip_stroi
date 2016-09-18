class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.string :name
      t.string :phone
      t.references :userable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
