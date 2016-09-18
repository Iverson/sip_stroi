ActiveAdmin.register_page "Domokomplekty" do
  title = I18n.t("active_admin.pages.domokomplekty")
  menu :label => title, :parent => I18n.t("active_admin.pages.title")

  content title: title do

    form :action => admin_projectdetails_update_path, :method => :post do |f|
      f.input :name => 'authenticity_token', :type => :hidden, :value => form_authenticity_token.to_s

      panel 'Контент' do
        fieldset do
          ol do
            li do
              label I18n.t('active_admin.text')
              f.textarea :name => "data[about.domokomplekty.text]", :class => 'ckeditor_input' do
                SiteSettings['about.domokomplekty.text']
              end
            end
          end
        end
      end

      f.input :type => 'submit', :value => I18n.t('active_admin.save')
    end
  end

  page_action :update, :method => :post do
    params['data'].each do |k, v|
      SiteSettings[k] = v
    end
    redirect_to :back, :notice => "Сохранено"
  end
end
