class ProjectInstanceType < ActiveRecord::Base
  validates :name, presence: true
end
