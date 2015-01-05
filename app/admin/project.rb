ActiveAdmin.register Project do
  permit_params :name, :price, :area, :description, pictures_attributes: [:image, :name, :description, :_destroy]

  form do |f|
    inputs 'Details' do
      input :name
      input :price
      input :area
    end

    panel 'Photos' do
    	f.has_many :pictures do |p|
    		p.input :image, :as => :file, :label => "Image",:hint => p.object.image.nil? ? p.template.content_tag(:span, "No Image Yet") : p.template.image_tag(p.object.image.url(:thumb))
    		p.input :_destroy, :as=>:boolean, :required => false, :label => 'Remove image'
    	end 
    end

    inputs 'Content', :description
    actions
  end

end
