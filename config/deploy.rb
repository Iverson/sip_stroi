# -*- encoding : utf-8 -*-
# siphomebuild - Поменять на ваш логин в панели управления
# sip-stroy - Поменять на имя вашего проекта
# sulfur - Поменять на имя вашего сервера (Указано на вкладке "FTP и SSH" вашей панели управления)
# set :repository - Установить расположение вашего репозитория
# У вас должна быть настроена авторизация ssh по сертификатам

require "bundler/capistrano"
set :stages, %w(staging production)
set :default_stage, "staging"
require 'capistrano/ext/multistage'

set :application, "sip_stroy"
set :repository,  "https://github.com/Iverson/sip_stroi.git"
set :branch, "develop"

dpath = "/home/hosting_siphomebuild/projects/sip-stroy"

set :user, "hosting_siphomebuild"
set :use_sudo, false
set :deploy_to, dpath

set :scm, :git

role :web, "sulfur.locum.ru"                          # Your HTTP server, Apache/etc
role :app, "sulfur.locum.ru"                          # This may be the same as your `Web` server
role :db,  "sulfur.locum.ru", :primary => true # This is where Rails migrations will run

after "deploy:update_code", :copy_database_config

task :copy_database_config, roles => :app do
  db_config = "#{shared_path}/database.yml"
  run "cp #{db_config} #{release_path}/config/database.yml"
end

set :unicorn_rails, "/var/lib/gems/1.8/bin/unicorn_rails"
set :unicorn_conf, "/etc/unicorn/sip-stroy.siphomebuild.rb"
set :unicorn_pid, "/var/run/unicorn/sip-stroy.siphomebuild.pid"

# - for unicorn - #
namespace :deploy do
  desc "Start application"
  task :start, :roles => :app do
    run "#{unicorn_rails} -Dc #{unicorn_conf}"
  end

  desc "Stop application"
  task :stop, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -QUIT `cat #{unicorn_pid}`"
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "[ -f #{unicorn_pid} ] && kill -USR2 `cat #{unicorn_pid}` || #{unicorn_rails} -Dc #{unicorn_conf}"
  end
end
