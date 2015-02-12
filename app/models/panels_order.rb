class PanelsOrder < Order
  has_many :items, class_name: 'PanelsOrderItem', :dependent => :destroy

  accepts_nested_attributes_for :items, :allow_destroy => true

  def total_price
    @items_prices_sum ||= self.items.select('sum(panels_order_items.price * panels_order_items.count) as total_price')[0][:total_price].to_i
  end
end