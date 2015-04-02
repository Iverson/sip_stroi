class Project < ActiveRecord::Base
  has_many :pictures, class_name: 'ProjectPicture', :dependent => :destroy
  has_many :plans, class_name: 'ProjectPlan', :dependent => :destroy
  has_many :building_photos, class_name: 'ProjectBuildingPhoto', :dependent => :destroy
  has_many :instances, class_name: 'ProjectInstance', :dependent => :destroy

  accepts_nested_attributes_for :pictures, :allow_destroy => true
  accepts_nested_attributes_for :plans, :allow_destroy => true
  accepts_nested_attributes_for :building_photos, :allow_destroy => true
  accepts_nested_attributes_for :instances, :allow_destroy => true, reject_if: :all_blank

  has_attached_file :cover_image, :styles => { :medium => "240x154#" }

  validates :name, presence: true
  validates :area, presence: true
  validates_attachment_content_type :cover_image, :content_type => /\Aimage\/.*\Z/

  scope :published, -> { where(published: true) }
  scope :sorted, -> { order(:id) }
  scope :sorted_by_area, -> { order(:area) }

  def prev
    @prev ||= self.class.published.sorted_by_area.where("area < ?", area).last
  end

  def next
    @next ||= self.class.published.sorted_by_area.where("area > ?", area).first
  end

  def cover
    if cover_image?
      cover_image.url(:medium)
    else
      "/images/project_nophoto.png"
    end
  end

  def order_cover
    unless pictures.empty?
      pictures.first.image.url(:medium)
    else
      "/images/project_nophoto.png"
    end
  end

  def default_price
    if instances.first
      instances.default.sum(:price).round(0)
    else
      0
    end
  end
end
