class UserInfo < ActiveRecord::Base
  belongs_to :userable, polymorphic: true

  validates :name, presence: true
  validates :phone, presence: true
end
