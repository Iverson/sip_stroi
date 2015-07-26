class SetUriToProjects < ActiveRecord::Migration
  def up
    if Project.count
      Project.all.each do |project|
        project.uri = project.name.parameterize
        project.save
      end
    end
  end

  def down
  end
end
