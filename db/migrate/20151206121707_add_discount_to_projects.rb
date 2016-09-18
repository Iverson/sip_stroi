class AddDiscountToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :discount, :float
  end
end
