class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name, null: false
      t.string :last_name
      t.string :email, null: false
      t.string :phone, null: false
      t.integer :city_id

      t.timestamps null: false
    end
  end
end
