class AddSectionToProject < ActiveRecord::Migration
  def change
    add_column :projects, :section, :string, null: false, default: "typical"
  end
end
