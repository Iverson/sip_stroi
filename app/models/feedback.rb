class Feedback < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, presence: true
	validates :message, presence: true
end
