class AddFieldsToProject < ActiveRecord::Migration
  def change
  	remove_column :projects, :price, :integer
  	add_column :projects, :floors, :integer
  end
end
