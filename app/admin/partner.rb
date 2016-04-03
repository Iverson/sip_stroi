ActiveAdmin.register Partner do
  title = I18n.t("active_admin.partners.title")
  menu :priority => 13, :label => title, :parent => I18n.t("active_admin.company")

  config.sort_order = "position_asc"
  config.paginate   = false
  sortable

  permit_params :name, :image, :url, :position

  controller do
    before_filter { @page_title = title }

    def update
      update! do |format|
        format.html { redirect_to edit_admin_partner_path }
      end
    end
  end

  index do
    sortable_handle_column
    selectable_column
    column t('active_admin.image') do |p|
      link_to(image_tag(p.image.url(:thumb)), edit_admin_partner_path(p))
    end

    actions
  end

  form do |f|
    inputs do
      input :name, label: t('active_admin.name')
      input :image, :required => false, :as => :file, label: t('active_admin.image'), hint: object.new_record? ? '' : image_tag(object.image.url(:thumb))
      input :url
    end

    actions
  end
end
