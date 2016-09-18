class AddUriToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :uri, :string
  end
end
