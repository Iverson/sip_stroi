class Client < ActiveRecord::Base
	validates :first_name, presence: true
	validates :email, presence: true
	validates :phone, presence: true
end
