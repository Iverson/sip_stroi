ActiveAdmin.register Article do
  title = I18n.t("active_admin.articles.title")
  menu :priority => 11, :label => title

  config.sort_order = "published_at_desc"
  config.paginate   = false
  sortable

  permit_params :id, :name, :content, :image, :published_at, :uri, :delete_image, meta_attributes: [:title, :description, :keywords, :_destroy]

  controller do
    before_filter { @page_title = title }

    defaults :finder => :find_by_uri

    def update
      update! do |format|
        format.html { redirect_to edit_admin_article_path }
      end
    end
  end

  index do
    selectable_column
    column t('active_admin.image') do |p|
      link_to(image_tag(p.image.url(:thumb), width: 150), edit_admin_article_path(p))
    end
    column t('active_admin.name'), :name, width: 200 do |p|
      link_to p.name, edit_admin_article_path(p)
    end
    column t('active_admin.published_at'), :published_at do |p|
      p.published_at
    end
    column t('active_admin.description'), :content do |p|
      p.announce_text
    end

    actions
  end

  form do |f|
    f.inputs "Article" do
      f.input :name
      input :uri
      input :published_at, label: t('active_admin.published_at'), as: :datepicker
      input :image, :required => false, :as => :file, label: t('active_admin.projects.form.cover'), hint: object.image.exists? ? image_tag(object.image.url(:medium)) : ''
      if object.image.exists?
        input :delete_image, as: :boolean, required: :false, label: 'Удалить'
      end
      f.input :content, :as => :ckeditor
    end

    if (f.object.new_record? || !f.object.meta) && f.object.errors.empty?
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
