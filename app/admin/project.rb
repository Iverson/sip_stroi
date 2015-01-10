ActiveAdmin.register Project do
  menu :priority => 5, :label => proc{ I18n.t("active_admin.projects") }

  permit_params :name, :price, :area, :description, project_pictures_attributes: [:id, :image, :name, :description, :_destroy]

  controller do
    def update
      update! do |format|
        format.html { redirect_to edit_admin_project_path }
      end
    end
  end

  form do |f|
    inputs 'Details' do
      input :name
      input :price
      input :area
    end

    panel 'Photos' do
    	f.has_many :project_pictures do |p|
    		p.input :image, :as => :file, :label => "Image",:hint => p.object.image.nil? ? p.template.content_tag(:span, "No Image Yet") : p.template.image_tag(p.object.image.url(:thumb))
    		p.input :_destroy, :as=>:boolean, :required => false, :label => 'Remove image'
    	end 
    end

    inputs 'Content', :description
    actions
  end

end
