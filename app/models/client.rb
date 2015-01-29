class Client < ActiveRecord::Base
	has_attached_file :photo, :styles => { :small => "58x58#", :medium => "150x150#" }

	validates :first_name, presence: true
	validates :email, presence: true
	validates :phone, presence: true
	validates :city, presence: true

  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  def select_title
     "(#{self.id}) #{self.first_name} #{self.last_name} (#{self.city})"
  end
end
