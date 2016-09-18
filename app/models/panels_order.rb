class PanelsOrder < Order
  has_many :items, class_name: 'PanelsOrderItem', :dependent => :destroy

  accepts_nested_attributes_for :items, :allow_destroy => true

  def total_price
    @items_prices_sum ||= self.items.select('sum(panels_order_items.price * panels_order_items.count) as total_price')[0][:total_price].to_i
  end

  def add_panels(panels_params)
    panels_params.each do |item|
      panel = Panel.find(item[1]["id"].to_i).as_json(:only => [:size, :price ], :methods => :material)
      panel["count"] = item[1]["count"]

      items.build(panel)
    end
  end
end