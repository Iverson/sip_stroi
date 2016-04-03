class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :city
      t.string :phone1
      t.string :phone2
      t.string :address
      t.text :info

      t.timestamps null: false
    end
  end
end
