class Timer < ActiveRecord::Base
  has_many :timeline_items

  include HarvestAssociations

  scope :active, -> {
    select { |t|
      t.updated_at + t.hours.to_f.hours > 10.minutes.ago ||
      t.created_at + t.hours.to_f.hours > 10.minutes.ago
    }
  }

  scope :recent, -> {
    select { |t|
      t.updated_at > 10.minutes.ago ||
      t.created_at > 10.minutes.ago
    }
  }

  def self.find_or_initialize_from_json(json)
    if !(timer = Timer.find_by_harvest_id(json["id"].to_i))
      timer = Timer.new
    end
    hash = {
      :project_id => $harvest.projects.find(json["project_id"].to_i),
      :user_id => $harvest.users.find(json["user_id"].to_i),
      :task_id => $harvest.tasks.find(json["task_id"].to_i),
      :client_id => $harvest.clients.all.detect{|c| c.name == json["client"]},
      :notes => json["notes"],
      :harvest_id => json["id"].to_i,
      :hours => json["hours"].to_f - json["hours_without_timer"].to_f,
      :created_at => json["created_at"].to_time,
      :updated_at => (json["timer_started_at"].present? ? json["timer_started_at"].to_time : json["updated_at"].to_time)
    }
    timer.update(hash)
  end

  def status(verb="is")
    "#{self.user.first_name} #{verb} working on #{self.client.name} (#{self.project.name} #{self.task.name})#{self.notes.present? ? ' - ' + self.notes : ''}"
  end

  def find_by_harvest_id(id)
    Timer.where(:harvest_id => id).first
  end

  def self.slack_recent
    created = Timer.where(["created_at > ?", 10.minutes.ago])
    created.each do |t|
      Slack.message(t.status('started'))
    end

    updated = Timer.where(["updated_at > ?", 10.minutes.ago])
    (updated - created).each do |t|
      Slack.message(t.status('continued'))
    end
  end
end
