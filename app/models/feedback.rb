class Feedback < ActiveRecord::Base
  has_one :user_info, as: :userable
  accepts_nested_attributes_for :user_info

  validates :message, presence: true
end
