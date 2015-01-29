class Review < ActiveRecord::Base
	belongs_to :client

	has_attached_file :image, :styles => { :medium => "279x168#" }

	validates :client_id, presence: true
	validates :text, presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
