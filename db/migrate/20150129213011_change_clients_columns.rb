class ChangeClientsColumns < ActiveRecord::Migration
  def self.up
    add_attachment :clients, :photo

    remove_column :clients, :city_id, :integer
  	add_column :clients, :city, :string
  end

  def self.down
    remove_attachment :clients, :photo

    add_column :clients, :city_id, :integer
  	remove_column :clients, :city, :string
  end
end
