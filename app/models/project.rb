class Project < ActiveRecord::Base
	has_many :pictures, class_name: 'ProjectPicture', :dependent => :destroy
	has_many :instances, class_name: 'ProjectInstance', :dependent => :destroy

	accepts_nested_attributes_for :pictures
	accepts_nested_attributes_for :instances

	validates :name, presence: true
	validates :area, presence: true

	def cover(type = :thumb)
		pictures.first.image.url(type)
	end

	def thumb_price
		instances.first.price.round(0) || 0
	end
end
