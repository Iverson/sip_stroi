class Article < ActiveRecord::Base
  validates :name, presence: true
  validates :content, presence: true

  has_attached_file :image, :styles => { :medium => "400x300#", :thumb => "200x150#" }, :default_url => "/images/:style/missing.png"

  validates :image, :attachment_presence => true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_with AttachmentSizeValidator, :attributes => :image, :less_than => 3.megabytes

  before_save() do
    unless self.uri?
      self.uri = "#{self.name}".parameterize
    end
  end

  def announce_text
    content.split('#CUT#')[0]
  end

  def full_text
    content.split('#CUT#').join
  end

  def to_param
    "#{uri}"
  end
end
