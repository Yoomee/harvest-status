class TimelineItem < ActiveRecord::Base
  belongs_to :timer

  scope :active, -> {
    select { |t|
      t.timer.updated_at + t.timer.hours.to_f.hours > 10.minutes.ago ||
      t.timer.created_at + t.timer.hours.to_f.hours > 10.minutes.ago
    }
  }

  scope :for_week, -> (week) {where(["EXTRACT(WEEK FROM created_at) = ?", week])}
  scope :for_month, -> (month) {where(["EXTRACT(MONTH FROM created_at) = ?", month])}
  scope :for_year, -> (year) {where(["EXTRACT(YEAR FROM created_at) = ?", year])}

  scope :by_day, -> {select("EXTRACT(DAY FROM created_at) AS day,SUM(hours) AS hours").group(:created_at).order("created_at DESC")}
  scope :by_week, -> {select("EXTRACT(WEEK FROM created_at) AS week,EXTRACT(YEAR FROM created_at) AS year,SUM(hours) AS hours").group("week,year").order("year, week DESC")}


  include HarvestAssociations

  def self.create_and_update_recent
    Timer.recent.each do |timer|
      TimelineItem.create(
        :timer_id => timer.id,
        :project_id => timer.project.id,
        :user_id => timer.user.id,
        :task_id => timer.task.id,
        :client_id => timer.client.id,
        :harvest_id => timer.harvest_id,
        :hours => timer.hours,
        :notes => timer.notes,
        :created_at => timer.updated_at,
        :icon => "calendar"
      )
    end
    Timer.active.each do |timer|
      if TimelineItem.where("timer_id = ? AND user_id = ?", timer.id, timer.user_id).present? && timeline_item = TimelineItem.where("timer_id = ? AND user_id = ?", timer.id, timer.user_id).active.first
        timeline_item.update(:hours => timer.hours)
      end
    end
  end

  def status
    "#{self.project.name} #{self.task.name}#{self.notes.present? ? ', ' + self.notes : ''}"
  end
end
