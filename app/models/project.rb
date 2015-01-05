class Project < ActiveRecord::Base
	has_many :pictures, as: :imageable, dependent: :destroy

	accepts_nested_attributes_for :pictures

	validates :name, presence: true
	validates :price, presence: true
	validates :area, presence: true
end
