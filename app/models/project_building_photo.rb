class ProjectBuildingPhoto < ActiveRecord::Base
	belongs_to :project

  has_attached_file :image, :styles => { :medium => "320x240>", :large => "800>" }, :default_url => "/images/:style/missing.png"

  validates :image, :attachment_presence => true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :image, :less_than => 5.megabytes
end
