class Panel < ActiveRecord::Base
  validates :size, presence: true
  validates :material1, presence: true
  validates :material2, presence: true
  validates :material3, presence: true
  validates :price, presence: true

  scope :published, -> { where(published: true) }

  def material
    "#{material1} — #{material2} — #{material3}"
  end
end
