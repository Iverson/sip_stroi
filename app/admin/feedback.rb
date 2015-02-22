ActiveAdmin.register Feedback do
  title = I18n.t("active_admin.feedback.title")
  menu :priority => 6, :label => title, :parent => I18n.t("active_admin.requests")

  permit_params :id, :message, user_info_attributes: [:id, :name, :phone, :_destroy]

  controller do
    before_filter { @page_title = title }
    skip_before_filter :init_feedback

    def update
      update! do |format|
        format.html { redirect_to edit_admin_feedback_path }
      end
    end
  end

  index do
    selectable_column
    column t('active_admin.name') do |p|
      link_to p.user_info.name, edit_admin_feedback_path(p)
    end
    column t('active_admin.phone') do |p|
      link_to p.user_info.phone, edit_admin_feedback_path(p)
    end
    column :message

    actions
  end

  form do |f|
    f.inputs "Feedback" do
      f.input :message
    end

    f.inputs t('active_admin.user_info.title'), for: [:user_info, f.object.user_info] do |user_info|
      user_info.input :name, label: t('active_admin.user_info.name')
      user_info.input :phone, label: t('active_admin.phone')

      user_info.actions
    end
    

    f.actions
  end
end
