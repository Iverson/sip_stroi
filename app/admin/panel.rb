ActiveAdmin.register Panel do
  title = I18n.t("active_admin.panels.title")
  menu :priority => 6, :label => title

  permit_params :size, :material1, :material2, :material3, :price

  controller do
    before_filter { @page_title = title }

    def update
      update! do |format|
        format.html { redirect_to edit_admin_panel_path }
      end
    end
  end

  index do
    selectable_column
    column t('active_admin.panels.size') do |p|
      link_to p.size, edit_admin_panel_path(p)
    end
    column t('active_admin.panels.materials') do |p|
      p.material
    end
    column t('active_admin.price'), :price

    actions
  end

  form do |f|
    inputs do
      input :size, label: t('active_admin.panels.size')
      input :price, label: t('active_admin.price')
    end

    inputs t('active_admin.panels.materials') do
      input :material1, label: t('active_admin.panels.material1')
      input :material2, label: t('active_admin.panels.material2')
      input :material3, label: t('active_admin.panels.material3')
    end

    actions
  end
end
