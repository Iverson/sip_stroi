class ProjectPicture < ActiveRecord::Base
	belongs_to :project
	
	has_attached_file :image, :styles => { :large => "800x600>", :medium => "500x500>", :thumb => "175x120>" }, :default_url => "/images/:style/missing.png"

  validates :image, :attachment_presence => true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :image, :less_than => 10.megabytes
end
