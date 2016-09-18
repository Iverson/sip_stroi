ActiveAdmin.register Offer do
  title = I18n.t("active_admin.offers.title")
  menu :priority => 14, :label => title

  permit_params :name, :image, :description

  controller do
    before_filter { @page_title = title }

    def update
      update! do |format|
        format.html { redirect_to edit_admin_offer_path }
      end
    end
  end

  index do
    selectable_column
    column t('active_admin.image') do |p|
      link_to(image_tag(p.image.url(:thumb)), edit_admin_offer_path(p))
    end
    column t('active_admin.name') do |p|
      link_to sanitize(p.name), edit_admin_offer_path(p)
    end
    column t('active_admin.description'), :description

    actions
  end

  form do |f|
    inputs do
      input :name, label: t('active_admin.name'), :as => :ckeditor
      input :description, label: t('active_admin.description'), :as => :ckeditor
      # input :image, :required => false, :as => :file, label: t('active_admin.image'), hint: object.new_record? ? '' : image_tag(object.image.url(:thumb))
    end

    actions
  end
end
