# encoding: utf-8

namespace :import do
  server_user     = "hosting_siphomebuild"
  server_host     = "sulfur.locum.ru"
  dump_path       = "tmp/prod.sql"
  server_app_path = "~/projects/sip-stroy"
  db_config       = YAML::load(IO.read("config/database.yml"))
  db_config_prod  = db_config["production"]
  db_config_dev   = db_config["development"]

  desc "Import DB from production"
  task :db do
    puts "Drop local DB..."
    %x(rake db:drop && rake db:create)
    puts "Making dump production DB, rsync and import to local DB..."
    %x(cap invoke COMMAND="pg_dump -h #{db_config_prod["host"]} -U #{db_config_prod["username"]} #{db_config_prod["database"]} > #{server_app_path}/current/#{dump_path}" && rsync -avz #{server_user}@#{server_host}:#{server_app_path}/current/#{dump_path} #{dump_path} && psql #{db_config_dev["database"]} < #{dump_path})
    puts "Done!"
  end

  desc "Import Static from production"
  task :static do
      puts "Rsync..."
      %x(rsync --progress -zvr #{server_user}@#{server_host}:#{server_app_path}/shared/system/ public/system/)
      puts "Done!"
  end
end