class AddDiscountToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :discount, :float
  end
end
