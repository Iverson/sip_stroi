ActiveAdmin.register Page do
  title = I18n.t("active_admin.pages.seo")
  menu :priority => 11, :label => title

  permit_params :id, :name, :uri, meta_attributes: [:title, :description, :keywords, :_destroy]

  controller do
    before_filter { @page_title = title }

    def update
      update! do |format|
        format.html { redirect_to edit_admin_page_path }
      end
    end
  end

  index do
    selectable_column
    column t('active_admin.name') do |p|
      link_to p.name, edit_admin_page_path(p)
    end
    column t('active_admin.uri') do |p|
      link_to p.uri, edit_admin_page_path(p)
    end

    actions
  end

  form do |f|
    f.inputs "Page" do
      f.input :name
      f.input :uri
    end

    if f.object.new_record? && f.object.errors.empty?
      f.object.build_meta()
    end

    f.inputs t('active_admin.meta'), for: [:meta, f.object.meta] do |meta|
      meta.input :title
      meta.input :description
      meta.input :keywords

      meta.actions
    end


    f.actions
  end
end
