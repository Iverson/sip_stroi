ActiveAdmin.register_page "ProjectDetails" do
  title = I18n.t("active_admin.pages.project_details")
  menu :label => title, :parent => I18n.t("active_admin.pages.title")

  content title: title do

    form :action => admin_projectdetails_update_path, :method => :post do |f|
      f.input :name => 'authenticity_token', :type => :hidden, :value => form_authenticity_token.to_s

      panel 'Контент' do
        fieldset do
          ol do
            li do
              label I18n.t('active_admin.project_details.individual')
              f.textarea :name => "data[project_details.individual]" do
                SiteSettings['project_details.individual']
              end
            end
            li do
              label I18n.t('active_admin.project_details.add_jobs')
              f.textarea :name => "data[project_details.add_jobs]" do
                SiteSettings['project_details.add_jobs']
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