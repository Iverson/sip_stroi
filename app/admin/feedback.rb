# ActiveAdmin.register Feedback do
#   title = I18n.t("active_admin.feedback.title")
#   menu :priority => 6, :label => title

#   # actions :all, only: [:show, :update, :destroy]
#   permit_params :id, :name, :phone, :message

#   controller do
#     before_filter { @page_title = title }

#     def update
#       update! do |format|
#         format.html { redirect_to edit_admin_feedback_path }
#       end
#     end
#   end

#   index do
#     selectable_column
#     column t('active_admin.name'), :name do |p|
#       link_to p.name, edit_admin_feedback_path(p)
#     end
#     column t('active_admin.projects.form.area'), :phone
#     column t('active_admin.projects.form.floors'), :message

#     actions
#   end

#   form do |f|
#     f.inputs "Feedback" do
#       f.input :name
#       f.input :phone
#       f.input :message
#     end
#     f.actions
#   end
# end
