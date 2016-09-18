class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.string :name
      t.attachment :image

      t.timestamps null: false
    end
  end
end
