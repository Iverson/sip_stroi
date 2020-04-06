class Project < ActiveRecord::Base
  has_many :pictures, class_name: 'ProjectPicture', :dependent => :destroy
  has_many :plans, class_name: 'ProjectPlan', :dependent => :destroy
  has_many :building_photos, class_name: 'ProjectBuildingPhoto', :dependent => :destroy
  has_many :instances, class_name: 'ProjectInstance', :dependent => :destroy
  has_one :meta, as: :metable

  accepts_nested_attributes_for :pictures, :allow_destroy => true
  accepts_nested_attributes_for :plans, :allow_destroy => true
  accepts_nested_attributes_for :building_photos, :allow_destroy => true
  accepts_nested_attributes_for :instances, :allow_destroy => true, reject_if: :all_blank
  accepts_nested_attributes_for :meta

  has_attached_file :cover_image, :styles => { :medium => "240x154>" }

  validates :name, presence: true
  validates :area, presence: true
  validates :uri, uniqueness: true
  validates_attachment_content_type :cover_image, :content_type => /\Aimage\/.*\Z/

  scope :published, -> { where(published: true) }
  scope :sorted, -> { order(:id) }
  scope :sorted_by_area, -> { order(:area) }
  scope :positioned, -> { order(:position) }
  acts_as_list
  scope :typical, -> { where(section: :typical) }
  scope :individual, -> { where(section: :individual) }
  scope :special, -> { where.not(discount: nil) }

  before_save() do
    unless self.uri?
      self.uri = "#{self.name}".parameterize
    end
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
    price = 0

    if instances.first
      price = instances.positioned.first.price
      price -= discount if discount?
    end

    price.round(0)
  end

  def to_param
    "#{uri}"
  end
end
