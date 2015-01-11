ActiveAdmin.register AdminUser do
  title = I18n.t("active_admin.admin_users")
  menu :label => title, :parent => I18n.t("active_admin.site_configuration")

  controller do
    before_filter { @page_title = title }
  end
  
  actions :all, :except => [:show]
  
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
