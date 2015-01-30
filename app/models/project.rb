class Project < ActiveRecord::Base
  has_many :pictures, class_name: 'ProjectPicture', :dependent => :destroy
  has_many :instances, class_name: 'ProjectInstance', :dependent => :destroy

  accepts_nested_attributes_for :pictures, :allow_destroy => true
  accepts_nested_attributes_for :instances, :allow_destroy => true

  has_attached_file :cover_image, :styles => { :medium => "240x154#" }

  validates :name, presence: true
  validates :area, presence: true
  validates_attachment_content_type :cover_image, :content_type => /\Aimage\/.*\Z/

  def cover
    if cover_image?
      cover_image.url(:medium)
    else
      "/images/project_nophoto.png"
    end
  end

  def thumb_price
    if instances.first
      instances.first.price.round(0)
    else
      0
    end
  end
end
