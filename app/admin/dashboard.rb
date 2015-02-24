ActiveAdmin.register_page "Dashboard" do
  title = I18n.t("active_admin.dashboard_title")
  menu priority: 1, label: title

  content :title => title do

    para content_tag(:h2, I18n.t("active_admin.projects.title"), :class => "h2")

    columns do
      column do
        panel I18n.t("active_admin.orders.new") do
          table_for ProjectsOrder.recived do |f|
            f.column :id
            f.column t('active_admin.user_info.name') do |o|
              link_to o.user_info.name, admin_projects_order_path(o)
            end
            f.column t('active_admin.user_info.phone') do |o|
              o.user_info.phone
            end
            f.column t('active_admin.orders.sum') do |o|
              o.total_price
            end
            f.column t('active_admin.orders.state') do |o|
              link_to o.aasm.human_state, edit_admin_projects_order_path(o)
            end
            f.column t('active_admin.date'), :created_at
          end
        end
      end

      column do
        panel I18n.t("active_admin.orders.confirmed") do
          table_for ProjectsOrder.confirmed do |f|
            f.column :id
            f.column t('active_admin.user_info.name') do |o|
              link_to o.user_info.name, admin_projects_order_path(o)
            end
            f.column t('active_admin.user_info.phone') do |o|
              o.user_info.phone
            end
            f.column t('active_admin.orders.sum') do |o|
              o.total_price
            end
            f.column t('active_admin.orders.state') do |o|
              link_to o.aasm.human_state, edit_admin_projects_order_path(o)
            end
            f.column t('active_admin.date'), :created_at
          end
        end
      end
    end

    para content_tag(:h2, I18n.t("active_admin.panels.title"), :class => "h2")

    columns do
      column do
        panel I18n.t("active_admin.orders.new") do
          table_for PanelsOrder.recived do |f|
            f.column :id
            f.column t('active_admin.user_info.name') do |o|
              link_to o.user_info.name, admin_panels_order_path(o)
            end
            f.column t('active_admin.user_info.phone') do |o|
              o.user_info.phone
            end
            f.column t('active_admin.orders.sum') do |o|
              o.total_price
            end
            f.column t('active_admin.orders.state') do |o|
              link_to o.aasm.human_state, edit_admin_panels_order_path(o)
            end
            f.column t('active_admin.date'), :created_at
          end
        end
      end

      column do
        panel I18n.t("active_admin.orders.confirmed") do
          table_for PanelsOrder.confirmed do |f|
            f.column :id
            f.column t('active_admin.user_info.name') do |o|
              link_to o.user_info.name, admin_panels_order_path(o)
            end
            f.column t('active_admin.user_info.phone') do |o|
              o.user_info.phone
            end
            f.column t('active_admin.orders.sum') do |o|
              o.total_price
            end
            f.column t('active_admin.orders.state') do |o|
              link_to o.aasm.human_state, edit_admin_panels_order_path(o)
            end
            f.column t('active_admin.date'), :created_at
          end
        end
      end
    end

    para content_tag(:h2, I18n.t("active_admin.feedback.title"), :class => "h2")

    columns do
      column do
        panel '' do
          table_for Feedback.all do |f|
            f.column :id
            column t('active_admin.user_info.name') do |p|
              link_to p.user_info.name, edit_admin_feedback_path(p)
            end
            column t('active_admin.phone') do |p|
              link_to p.user_info.phone, edit_admin_feedback_path(p)
            end
            column t('active_admin.message'), :message

            f.column t('active_admin.date'), :created_at
          end
        end
      end
    end
  end # content
end
