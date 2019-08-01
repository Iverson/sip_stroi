class Office < ActiveRecord::Base
  # validates :city, presence: true
  validates :phone1, presence: true

  scope :positioned, -> { order(:position) }
  acts_as_list

  def phones()
    [phone1, phone2].reject(&:blank?)
  end
end
