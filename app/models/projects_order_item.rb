class ProjectsOrderItem < ActiveRecord::Base
  belongs_to :projects_order
  
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
