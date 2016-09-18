class AddPositionToCertificates < ActiveRecord::Migration
  def change
    add_column :certificates, :position, :integer, default: 1
  end
end
