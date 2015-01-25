ActiveAdmin.register Project do
  title = I18n.t("active_admin.projects.title")
  menu :priority => 5, :label => title

  permit_params :name, :floors, :area, :description, pictures_attributes: [:id, :image, :_destroy], instances_attributes: [:id, :instance_type_id, :price, :description, :_destroy]

  controller do
    before_filter { @page_title = title }

    def update
      update! do |format|
        format.html { redirect_to edit_admin_project_path }
      end
    end
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'Details' do
      input :name
      input :floors
      input :area
      # require 'pry'; binding.pry
      if f.object.new_record? && f.object.errors.empty?
        f.object.instances.build()
      end

      f.has_many :instances, heading: I18n.t("active_admin.projects.instances.label"), allow_destroy: true do |p|
        p.input :instance_type, label: I18n.t("active_admin.projects.instances.type")
        p.input :price
        p.input :description
      end

    end

    if f.object.new_record?
      f.object.pictures.build()
    end

    panel I18n.t("active_admin.projects.pictures") do
    	f.has_many :pictures, heading: '', allow_destroy: true do |p|
    		p.input :image, :as => :file, :label => "Image",:hint => p.object.image.nil? ? p.template.content_tag(:span, "No Image Yet") : p.template.image_tag(p.object.image.url(:thumb))
    	end 
    end

    inputs 'Content', :description
    actions
  end

end
