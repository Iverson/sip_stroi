ActiveAdmin.register Client do
  title = I18n.t("active_admin.clients")
  menu :priority => 6, :label => title

  permit_params :first_name, :last_name, :email, :phone, :city_id

  controller do
    before_filter { @page_title = title }
  end
end
