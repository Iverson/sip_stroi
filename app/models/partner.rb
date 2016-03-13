class Partner < ActiveRecord::Base
  has_attached_file :image, :styles => { :thumb => "x100" }, :default_url => "/images/:style/missing.png"

  validates :name, presence: true
  validates :image, :attachment_presence => true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :image, :less_than => 1.megabytes

  scope :positioned, -> { order(:position) }
  acts_as_list
end
