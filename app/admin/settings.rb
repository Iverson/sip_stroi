ActiveAdmin.register_page "Settings" do
  title = I18n.t("active_admin.site_configuration")
  menu priority: 2, :label => title, :parent => I18n.t("active_admin.settings")

  content title: title do

    form :action => admin_settings_update_path, :method => :post do |f|
      f.input :name => 'authenticity_token', :type => :hidden, :value => form_authenticity_token.to_s
      panel title do
        fieldset do
          ol do
            li do
              label 'Телефон 1 (Москва)'
              f.input :name => "data[phone1]", :type => 'text', :value => SiteSettings.phone1
            end
            li do
              label 'Телефон 2 (Москва)'
              f.input :name => "data[phone2]", :type => 'text', :value => SiteSettings.phone2
            end
            li do
              label 'Режим работы (Москва)'
              f.input :name => "data[office1]", :type => 'text', :value => SiteSettings.office1
            end
            li do
              label 'Телефон 1 (Санкт-Петербург)'
              f.input :name => "data[phone3]", :type => 'text', :value => SiteSettings.phone3
            end
            li do
              label 'Телефон 2 (Санкт-Петербург)'
              f.input :name => "data[phone4]", :type => 'text', :value => SiteSettings.phone4
            end
            li do
              label 'Режим работы (Санкт-Петербург)'
              f.input :name => "data[office2]", :type => 'text', :value => SiteSettings.office2
            end
            li do
              label 'Title'
              f.input :name => "data[site_title]", :type => 'text', :value => SiteSettings.site_title
            end
          end
        end
      end
      f.input :type => 'submit', :value => 'Save'
    end
  end

  page_action :update, :method => :post do
    params['data'].each do |k, v|
      SiteSettings[k] = v
    end
    redirect_to :back, :notice => "#{params[:key]} added"
  end
end
