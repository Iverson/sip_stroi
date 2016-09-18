class Page < ActiveRecord::Base
  has_one :meta, as: :metable
  accepts_nested_attributes_for :meta

  validates :name, presence: true
  validates :uri, presence: true
end
