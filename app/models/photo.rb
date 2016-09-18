class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => { :large => "800x600#", :thumb => "332x244#" }, :default_url => "/images/:style/missing.png"

  validates :image, :attachment_presence => true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :image, :less_than => 3.megabytes
end
