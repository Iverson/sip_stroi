class PanelsOrder < Order
  has_many :items, class_name: 'PanelsOrderItem', :dependent => :destroy

  accepts_nested_attributes_for :items, :allow_destroy => true
end