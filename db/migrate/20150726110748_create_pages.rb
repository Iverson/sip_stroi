class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name, null: false
      t.string :uri, null: false

      t.timestamps null: false
    end
  end
end
