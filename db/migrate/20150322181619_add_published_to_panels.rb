class AddPublishedToPanels < ActiveRecord::Migration
  def change
    add_column :panels, :published, :boolean, default: true
  end
end
