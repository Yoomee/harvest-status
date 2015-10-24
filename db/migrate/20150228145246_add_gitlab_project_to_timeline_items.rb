class AddGitlabProjectToTimelineItems < ActiveRecord::Migration
  def change
    add_column :timeline_items, :gitlab_project, :string
  end
end
