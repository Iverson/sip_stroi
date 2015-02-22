class ProjectsOrder < Order
  has_many :items, class_name: 'ProjectsOrderItem', :dependent => :destroy
  accepts_nested_attributes_for :items, :allow_destroy => true

  def total_price
    @items_prices_sum ||= self.items.select('sum(projects_order_items.price) as total_price')[0][:total_price].to_i
  end

  def add_items(items_ids = [])
    instances = ProjectInstance.where(id: items_ids)

    instances.each do |item|
      panel = item.as_json(:only => [:name, :description, :price ])

      items.build(panel)
    end
  end

  def add_project_params(project_id)
    project = Project.find(project_id)
    self.name = project.name
  end
end
