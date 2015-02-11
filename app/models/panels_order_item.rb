class PanelsOrderItem < ActiveRecord::Base
  belongs_to :panels_order
  
  validates :size, presence: true
  validates :material, presence: true
  validates :count, presence: true
  validates :price, presence: true
end
