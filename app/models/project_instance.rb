class ProjectInstance < ActiveRecord::Base
  belongs_to :project
  belongs_to :instance_type, class_name: 'ProjectInstanceType'

  validates :instance_type_id, presence: true
  validates :price, presence: true
  validates :description, presence: true
end
