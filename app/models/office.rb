class Office < ActiveRecord::Base
  validates :city, presence: true
  validates :phone1, presence: true

  scope :positioned, -> { order(:position) }
  acts_as_list
end
