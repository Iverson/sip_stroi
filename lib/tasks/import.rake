# encoding: utf-8

namespace :import do
  server_user     = "hosting_siphomebuild"
  server_host     = "sulfur.locum.ru"
  dump_path       = "tmp/prod.dump"
  server_app_path = "~/projects/sip-stroy"
  db_config       = YAML::load(IO.read("config/database.yml"))
  db_config_prod  = db_config["production"]
  db_config_dev   = db_config["development"]

  desc "Import DB from production"
  task :db do
    puts "Drop local DB..."
    %x(rake db:drop && rake db:create)
    puts "Making dump production DB, rsync and import to local DB..."
    %x(pg_dump --host #{db_config_prod["host"]} --username #{db_config_prod["username"]} --verbose --clean --no-owner --no-acl --format=c #{db_config_prod["database"]} > #{Rails.root}/#{dump_path})
    puts "Done!"
  end

  desc "Import dump from production"
  task :dump do
      puts "Rsync..."
      %x(rsync --progress -zvr #{server_user}@#{server_host}:~/prod.dump tmp/prod.dump)
      puts "Done!"
  end

  desc "Import Static from production"
  task :static do
      puts "Rsync..."
      %x(rsync --progress -zvr #{server_user}@#{server_host}:#{server_app_path}/shared/system/ public/system/)
      %x(rsync --progress -zvr #{server_user}@#{server_host}:#{server_app_path}/shared/ckeditor_assets/ public/ckeditor_assets/)
      puts "Done!"
  end

  desc "Import prodution log"
  task :log do
      puts "Rsync..."
      %x(rsync --progress -zvr #{server_user}@#{server_host}:#{server_app_path}/shared/log/production.log tmp/production.log)
      puts "Done!"
  end
end
