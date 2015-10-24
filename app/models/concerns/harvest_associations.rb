module HarvestAssociations

  extend ActiveSupport::Concern

  def user
    $harvest.users.find(self.user_id)
  end

  def project
    $harvest.projects.find(self.project_id)
  end

  def client
    $harvest.clients.find(self.client_id)
  end

  def task
    $harvest.tasks.find(self.task_id)
  end



end
