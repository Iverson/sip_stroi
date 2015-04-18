ActiveAdmin.register Certificate do
  title = I18n.t("active_admin.certificates.title")
  menu :priority => 12, :label => title

  permit_params :name, :image

  controller do
    before_filter { @page_title = title }

    def update
      update! do |format|
        format.html { redirect_to edit_admin_certificate_path }
      end
    end
  end

  index do
    selectable_column
    column t('active_admin.image') do |p|
      link_to(image_tag(p.image.url(:thumb)), edit_admin_certificate_path(p))
    end

    actions
  end

  form do |f|
    inputs do
      input :image, :required => false, :as => :file, label: t('active_admin.image'), hint: object.new_record? ? '' : image_tag(object.image.url(:thumb))
    end

    actions
  end
end
