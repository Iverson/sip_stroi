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

  index do
    selectable_column
    column t('active_admin.image') do |p|
      link_to(image_tag(p.cover, height: 50), edit_admin_project_path(p))
    end
    column t('active_admin.name'), :name do |p|
      link_to p.name, edit_admin_project_path(p)
    end
    column t('active_admin.projects.form.area'), :area
    column t('active_admin.projects.form.floors'), :floors

    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    inputs do
      input :name, label: t('active_admin.name')
      input :floors, label: t('active_admin.projects.form.floors')
      input :area, label: t('active_admin.projects.form.area')
      # require 'pry'; binding.pry
      if f.object.new_record? && f.object.errors.empty?
        f.object.instances.build()
      end

      f.has_many :instances, heading: t("active_admin.projects.instances.label"), allow_destroy: true do |p|
        p.input :instance_type, label: t("active_admin.projects.instances.type")
        p.input :price, label: t('active_admin.price')
        p.input :description, label: t('active_admin.description')
      end

    end

    if f.object.new_record?
      f.object.pictures.build()
    end

    panel t("active_admin.projects.pictures") do
    	f.has_many :pictures, heading: '', allow_destroy: true do |p|
    		p.input :image, :as => :file, :label => t('active_admin.image'), :hint => p.object.image.nil? ? p.template.content_tag(:span, "No Image Yet") : p.template.image_tag(p.object.image.url(:thumb))
    	end 
    end

    actions
  end

end
