class ProjectInstance < ActiveRecord::Base
  belongs_to :project

  scope :default, -> { where(default: true) }
  scope :order_by_id, -> { order(:id) }

  validates :name, presence: true
  validates :price, presence: true
end
