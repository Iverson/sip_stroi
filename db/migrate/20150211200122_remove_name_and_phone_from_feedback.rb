class RemoveNameAndPhoneFromFeedback < ActiveRecord::Migration
  def change
    remove_column :feedbacks, :name, :string
    remove_column :feedbacks, :phone, :string
  end
end
