class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :state
      t.string :message

      t.timestamps null: false
    end
  end
end
