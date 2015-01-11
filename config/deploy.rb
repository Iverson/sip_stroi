require 'bundler/capistrano'

## Чтобы не хранить database.yml в системе контроля версий, поместите
## dayabase.yml в shared-каталог проекта на сервере и раскомментируйте
## следующие строки.

# after "deploy:update_code", :copy_database_config
# task :copy_database_config, roles => :app do
#   db_config = "#{shared_path}/database.yml"
#   run "cp #{db_config} #{release_path}/config/database.yml"
# end

# Если вы не используете авторизацию SSH по ключам И ssh-agent,
# закомментируйте эту опцию.
ssh_options[:forward_agent] = true

# Имя вашего проекта в панели управления.
# Не меняйте это значение без необходимости, оно используется дальше.
set :application,     "sip-stroy"

# Сервер размещения проекта.
set :deploy_server,   "sulfur.locum.ru"

# Не включать в поставку разработческие инструменты и пакеты тестирования.
set :bundle_without,  [:development, :test]

set :user,            "hosting_siphomebuild"
set :login,           "siphomebuild"
set :use_sudo,        false
set :deploy_to,       "/home/#{user}/projects/#{application}"
set :unicorn_conf,    "/etc/unicorn/#{application}.#{login}.rb"
set :unicorn_pid,     "/var/run/unicorn/#{user}/#{application}.#{login}.pid"
set :bundle_dir,      File.join(fetch(:shared_path), 'gems')
role :web,            deploy_server
role :app,            deploy_server
role :db,             deploy_server, :primary => true

set :rvm_ruby_string, "2.1.5"
set :rake,            "rvm use #{rvm_ruby_string} do bundle exec rake" 
set :bundle_cmd,      "rvm use #{rvm_ruby_string} do bundle"

set :scm,             :git
set :repository,      "https://github.com/Iverson/sip_stroi.git"
set :branch, "develop"

before 'deploy:finalize_update', 'set_current_release'
task :set_current_release, :roles => :app do
    set :current_release, latest_release
end

after "deploy:update_code", "deploy:migrate"
after "deploy", "deploy:cleanup"

set :unicorn_start_cmd, "(cd #{deploy_to}/current; rvm use #{rvm_ruby_string} do bundle exec unicorn -Dc #{unicorn_conf})"

# - for unicorn - #
namespace :deploy do
  desc "Start application"
  task :start, :roles => :app do
    run unicorn_start_cmd
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_start_cmd}"
  end
end

require './config/boot'
require 'airbrake/capistrano'
