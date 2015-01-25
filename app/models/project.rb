class Project < ActiveRecord::Base
	has_many :pictures, class_name: 'ProjectPicture', :dependent => :destroy
	has_many :instances, class_name: 'ProjectInstance', :dependent => :destroy

	accepts_nested_attributes_for :pictures, :allow_destroy => true
	accepts_nested_attributes_for :instances, :allow_destroy => true

	validates :name, presence: true
	validates :area, presence: true

	def cover(type = :thumb)
		if pictures.first
			pictures.first.image.url(type)
		else
			"/images/project_nophoto.png"
		end
	end

	def thumb_price
		if instances.first
			instances.first.price.round(0)
		else
			0
		end
	end
end
