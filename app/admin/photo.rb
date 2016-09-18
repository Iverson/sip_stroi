ActiveAdmin.register Photo do
  title = I18n.t("active_admin.photos.title")
  menu :priority => 6, :label => title, :parent => I18n.t("active_admin.catalog")

  permit_params :name, :image, :description

  controller do
    before_filter { @page_title = title }

    def update
      update! do |format|
        format.html { redirect_to edit_admin_photo_path }
      end
    end
  end

  index do
    selectable_column
    column t('active_admin.image') do |p|
      link_to(image_tag(p.image.url(:thumb)), edit_admin_photo_path(p))
    end
    column t('active_admin.clients.form.name') do |p|
      link_to p.name, edit_admin_photo_path(p)
    end

    actions
  end

  form do |f|
    inputs do
      input :name, label: t('active_admin.name')
      input :image, :required => false, :as => :file, label: t('active_admin.image'), hint: object.new_record? ? '' : image_tag(object.image.url(:thumb))
      input :description, label: t('active_admin.description'), :as => :ckeditor
    end

    actions
  end
end
