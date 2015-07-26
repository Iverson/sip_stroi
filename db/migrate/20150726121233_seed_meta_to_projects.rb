class SeedMetaToProjects < ActiveRecord::Migration
  def up
    if Project.count
      Project.all.each do |project|
        project.meta.delete if project.meta
        project.build_meta
        project.save
      end
    end
  end

  def down
  end
end
