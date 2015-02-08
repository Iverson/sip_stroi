ActiveAdmin.register_page "Index" do
  title = I18n.t("active_admin.pages.index")
  menu :label => title, :parent => I18n.t("active_admin.pages.title")

  content title: title do

    form :action => admin_index_update_path, :method => :post do |f|
      f.input :name => 'authenticity_token', :type => :hidden, :value => form_authenticity_token.to_s
      
      panel I18n.t('active_admin.index.header') do
        fieldset do
          ol do
            li do
              label I18n.t('active_admin.index.title')
              f.textarea :name => "data[index.title]" do
                SiteSettings['index.title']
              end
            end
          end
        end
      end

      panel I18n.t('active_admin.index.individual') do
        fieldset do
          ol do
            li do
              label I18n.t('active_admin.title')
              f.input :name => "data[index.individual.title]", :type => 'text', :value => SiteSettings['index.individual.title']
            end
            li do
              label I18n.t('active_admin.text')
              f.textarea :name => "data[index.individual.text]" do
                SiteSettings['index.individual.text']
              end
            end
          end
        end
      end

      panel I18n.t('active_admin.index.features') do
        para '1)'
        fieldset do
          ol do
            li do
              label I18n.t('active_admin.title')
              f.input :name => "data[index.features.fast.title]", :type => 'text', :value => SiteSettings['index.features.fast.title']
            end
            li do
              label I18n.t('active_admin.text')
              f.textarea :name => "data[index.features.fast.text]" do
                SiteSettings['index.features.fast.text']
              end
            end
          end
        end

        para '2)'
        fieldset do
          ol do
            li do
              label I18n.t('active_admin.title')
              f.input :name => "data[index.features.eco.title]", :type => 'text', :value => SiteSettings['index.features.eco.title']
            end
            li do
              label I18n.t('active_admin.text')
              f.textarea :name => "data[index.features.eco.text]" do
                SiteSettings['index.features.eco.text']
              end
            end
          end
        end

        para '3)'
        fieldset do
          ol do
            li do
              label I18n.t('active_admin.title')
              f.input :name => "data[index.features.tech.title]", :type => 'text', :value => SiteSettings['index.features.tech.title']
            end
            li do
              label I18n.t('active_admin.text')
              f.textarea :name => "data[index.features.tech.text]" do
                SiteSettings['index.features.tech.text']
              end
            end
          end
        end
      end

      panel I18n.t('active_admin.index.panels') do
        fieldset do
          ol do
            li do
              label I18n.t('active_admin.text')
              f.textarea :name => "data[index.panels.text]" do
                SiteSettings['index.panels.text']
              end
            end
          end
        end
      end

      panel I18n.t('active_admin.index.questions') do
        fieldset do
          ol do
            li do
              label I18n.t('active_admin.text')
              f.textarea :name => "data[index.questions.text]" do
                SiteSettings['index.questions.text']
              end
            end
          end
        end
      end

      f.input :type => 'submit', :value => 'Сохранить'
    end
  end

  page_action :update, :method => :post do
    params['data'].each do |k, v|
      SiteSettings[k] = v
    end
    redirect_to :back, :notice => "Сохранено"
  end
end