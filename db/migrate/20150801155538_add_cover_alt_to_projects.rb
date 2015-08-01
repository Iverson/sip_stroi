class AddCoverAltToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :cover_alt, :string
  end
end
