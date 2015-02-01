class ProjectInstance < ActiveRecord::Base
  belongs_to :project

  scope :default, -> { where(default: true) }

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
