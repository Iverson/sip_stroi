class Offer < ActiveRecord::Base
  has_attached_file :image, :styles => { :thumb => "175x120#" }

  validates :name, presence: true
  validates :description, presence: true

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :image, :less_than => 2.megabytes
end
