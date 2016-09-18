ActiveAdmin.register Review do
  title = I18n.t("active_admin.reviews.title")
  menu :priority => 6, :label => title, :parent => I18n.t("active_admin.clients.title")

  permit_params :text, :client_id, :image, :image_alt

  controller do
    before_filter { @page_title = title }

    def update
      update! do |format|
        format.html { redirect_to edit_admin_review_path }
      end
    end
  end

  index do
    selectable_column
    column t('active_admin.reviews.form.client') do |p|
      link_to(image_tag(p.client.photo.url(:small)), edit_admin_review_path(p))
    end
    column t('active_admin.clients.form.name') do |p|
      link_to "#{p.client.first_name} #{p.client.last_name}", edit_admin_review_path(p)
    end
    column t('active_admin.city') do |p|
      p.client.city
    end
    column t('active_admin.text'), :text

    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    inputs do
      input :client_id, :as => :select, :multiple => false, :collection => Client.all.map { |a| [ a.select_title, a.id ]}
      input :image, :required => false, :as => :file, label: t('active_admin.reviews.form.image'), hint: object.new_record? ? '' : image_tag(object.image.url(:medium))
      input :image_alt
      input :text, label: t('active_admin.reviews.form.text')
    end

    actions
  end
end
