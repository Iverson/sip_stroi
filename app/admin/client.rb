ActiveAdmin.register Client do
  title = I18n.t("active_admin.clients.title")
  menu :priority => 6, :label => title, :parent => I18n.t("active_admin.clients.title")

  permit_params :first_name, :last_name, :email, :phone, :city, :photo

  controller do
    before_filter { @page_title = title }

    def update
      update! do |format|
        format.html { redirect_to edit_admin_client_path }
      end
    end
  end

  index do
    selectable_column
    column t('active_admin.image') do |p|
      link_to(image_tag(p.photo.url(:small)), edit_admin_client_path(p))
    end
    column t('active_admin.clients.form.name') do |p|
      link_to "#{p.first_name} #{p.last_name}", edit_admin_client_path(p)
    end
    column t('active_admin.city'), :city
    column t('active_admin.phone'), :phone
    column t('active_admin.email'), :email

    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    inputs do
      input :first_name, label: t('active_admin.clients.form.first_name')
      input :last_name, label: t('active_admin.clients.form.last_name')
      input :email, label: t('active_admin.clients.form.email')
      input :phone, label: t('active_admin.clients.form.phone')
      input :city, label: t('active_admin.clients.form.city')
      input :photo, :required => false, :as => :file, label: t('active_admin.clients.form.photo'), hint: object.new_record? ? '' : image_tag(object.photo.url(:medium))
    end

    actions
  end
end
