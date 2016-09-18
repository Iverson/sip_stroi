ActiveAdmin.register Office do
  title = I18n.t("active_admin.offices.title")
  menu :priority => 12, :label => title, :parent => I18n.t("active_admin.company")

  config.sort_order = "position_asc"
  config.paginate   = false
  sortable

  permit_params :city, :phone1, :phone2, :address, :info

  controller do
    before_filter { @page_title = title }

    def update
      update! do |format|
        format.html { redirect_to edit_admin_office_path }
      end
    end
  end

  index do
    sortable_handle_column
    selectable_column
    column t('active_admin.city'), :city
    column t('active_admin.phone') do |p|
      p.phone1
    end
    column t('active_admin.address'), :address
    column t('active_admin.info'), :info

    actions
  end

  form do |f|
    inputs do
      input :city
      input :phone1
      input :phone2
      # input :address
      input :info, :as => :ckeditor, :input_html => {:class => "plain_text"}
    end

    actions
  end
end
