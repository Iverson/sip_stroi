class AddPositionToOffices < ActiveRecord::Migration
  def change
    add_column :offices, :position, :integer, default: 1
  end
end
