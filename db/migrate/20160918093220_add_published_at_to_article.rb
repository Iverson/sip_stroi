class AddPublishedAtToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :published_at, :date, :default => Date.today
  end
end
