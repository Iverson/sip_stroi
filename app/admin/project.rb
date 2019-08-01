ActiveAdmin.register Project do
  title = I18n.t("active_admin.projects.title")
  menu :priority => 5, :label => title, :parent => I18n.t("active_admin.catalog")

  config.sort_order = "position_asc"
  config.paginate   = false
  sortable

  permit_params :name, :section, :floors, :area, :dimensions, :ceiling_height, :published, :description, :discount, :cover_image, :cover_alt, :position, pictures_attributes: [:id, :name, :image, :_destroy], plans_attributes: [:id, :name, :image, :_destroy], building_photos_attributes: [:id, :name, :image, :_destroy], instances_attributes: [:id, :name, :price, :description, :position, :default, :_destroy], meta_attributes: [:title, :description, :keywords, :_destroy]

  scope "Типовые", :typical, :default => true
  scope "Индивидуальные", :individual

  controller do
    before_filter { @page_title = title }

    defaults :finder => :find_by_uri

    def update
      update! do |format|
        format.html { redirect_to edit_admin_project_path }
      end
    end
  end

  index do
    sortable_handle_column
    selectable_column
    column t('active_admin.image') do |p|
      link_to(image_tag(p.cover, height: 50), edit_admin_project_path(p))
    end
    column t('active_admin.name'), :name do |p|
      link_to p.name, edit_admin_project_path(p)
    end
    column t('active_admin.projects.form.area'), :area
    column t('active_admin.projects.form.floors'), :floors
    column t('active_admin.published'), :published
    column t('active_admin.position'), :position

    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    inputs do
      input :name, label: t('active_admin.name')
      input :section, label: t('active_admin.section'), :as => :select, include_blank: false, :multiple => false, :collection => [["Типовые", "typical"], ["Индивидуальные", "individual"]]
      input :uri
      input :floors, label: t('active_admin.projects.form.floors')
      input :area, label: t('active_admin.projects.form.area')
      input :dimensions, label: t('active_admin.projects.form.dimensions')
      input :ceiling_height, label: t('active_admin.projects.form.ceiling_height')
      input :discount, label: t('active_admin.projects.form.discount')

      input :cover_image, :required => false, :as => :file, label: t('active_admin.projects.form.cover'), hint: object.cover_image.exists? ? image_tag(object.cover_image.url(:medium)) : ''
      input :cover_alt
      input :published, label: t('active_admin.published')
    end

    if f.object.new_record? && f.object.errors.empty?
      f.object.instances.build()
    end

    panel "#{t("active_admin.projects.instances.label")} (#{f.object.instances.count})" do
      f.has_many :instances, for: [:instances, f.object.instances.positioned], sortable: :position, heading: '', allow_destroy: true do |p|
        p.input :name, label: t("active_admin.projects.instances.type")
        p.input :price, label: t('active_admin.price')
        p.input :description, label: t('active_admin.description')
        p.input :default, label: t('active_admin.projects.instances.default')
      end
    end

    if f.object.new_record?
      f.object.pictures.build()
    end

    panel t("active_admin.projects.pictures") do
    	f.has_many :pictures, heading: '', allow_destroy: true do |p|
    		p.input :image, :as => :file, :label => t('active_admin.image'), :hint => p.object.image.exists? ? p.template.image_tag(p.object.image.url(:thumb)) : ''
        p.input :name, :label => 'Alt'
    	end
    end

    if f.object.new_record?
      f.object.plans.build()
    end

    panel t("active_admin.projects.plans") do
      f.has_many :plans, heading: '', allow_destroy: true do |p|
        p.input :image, :as => :file, :label => t('active_admin.image'), :hint => p.object.image.exists? ? p.template.image_tag(p.object.image.url(:medium), height: 150) : ''
        p.input :name, :label => 'Alt'
      end
    end

    if f.object.new_record?
      f.object.building_photos.build()
    end

    panel t("active_admin.projects.building_photos") do
      f.has_many :building_photos, heading: '', allow_destroy: true do |p|
        p.input :image, :as => :file, :label => t('active_admin.image'), :hint => p.object.image.exists? ? p.template.image_tag(p.object.image.url(:medium), height: 150) : ''
        p.input :name, :label => 'Alt'
      end
    end

    if f.object.new_record? && f.object.errors.empty?
      f.object.build_meta()
    end

    f.inputs t('active_admin.meta'), for: [:meta, f.object.meta] do |meta|
      meta.input :title
      meta.input :description
      meta.input :keywords

      meta.actions
    end

    actions
  end

end
