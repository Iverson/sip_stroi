class Project < ActiveRecord::Base
	has_many :project_pictures, :dependent => :destroy

	accepts_nested_attributes_for :project_pictures

	validates :name, presence: true
	validates :price, presence: true
	validates :area, presence: true
end
