ActiveAdmin.register PanelsOrder do
  title = I18n.t("active_admin.panels_orders.title")
  menu :priority => 6, :label => title, :parent => I18n.t("active_admin.requests")

  permit_params :message, :state, items_attributes: [:id, :size, :material, :count, :price, :_destroy], user_info_attributes: [:id, :name, :phone, :_destroy]

  controller do
    before_filter { @page_title = title }

    def update
      update! do |format|
        format.html { redirect_to edit_admin_panels_order_path }
      end
    end
  end

  index do
    selectable_column
    column :id
    column t('active_admin.user_info.name') do |p|
      p.user_info.name
    end
    column t('active_admin.user_info.phone') do |p|
      p.user_info.phone
    end
    column t('active_admin.orders.sum') do |p|
      p.total_price
    end
    column t('active_admin.orders.state') do |p|
      p.aasm.human_state
    end
    column t('active_admin.date'), :created_at

    actions
  end

  show do |order|
    attributes_table do
      row t('active_admin.orders.state') do
        order.aasm.human_state
      end
      row "Заказчик" do
        order.user_info.name
      end
      row t('active_admin.user_info.phone') do
        order.user_info.phone
      end
      row "Комментарий заказчика" do
        order.message
      end
    end

    panel t("active_admin.panels.title") do
      table_for(order.items) do
        column "Размер" do |item|
          item.size
        end
        column t("active_admin.panels.material") do |item|
          item.material
        end
        column t("active_admin.price") do |item|
          item.price
        end
        column t("active_admin.count") do |item|
          item.count
        end
      end
      para "Итого: #{order.total_price}"
      para "<div class='print-css'><br /></div>".html_safe
    end

    # active_admin_comments
  end

  form do |f|
    inputs t("active_admin.order") do
      f.input :state, :label => t('active_admin.orders.state'), :as => :select, :collection => f.object.aasm.states(:permitted => true).map{|s| [s.human_name , s.name]}, :include_blank => f.object.aasm.human_state
      f.input :message

      f.inputs t('active_admin.user_info.title'), for: [:user_info, f.object.user_info] do |user_info|
        user_info.input :name, label: t('active_admin.user_info.name')
        user_info.input :phone, label: t('active_admin.phone')
      end

      if f.object.new_record? && f.object.errors.empty?
        f.object.items.build()
      end

      f.has_many :items, heading: t("active_admin.panels.title"), allow_destroy: true do |p|
        p.input :size, label: t("active_admin.panels.size")
        p.input :material, label: t("active_admin.panels.material")
        p.input :count, label: t('active_admin.count')
        p.input :price, label: t('active_admin.price')
      end
    end

    actions
  end
end
