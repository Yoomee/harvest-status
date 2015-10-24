namespace :cleanup do
  desc "TODO"
  task database: :environment do
    (Timer.where(["created_at < ?", 7.days.ago]) + TimelineItem.where(["created_at < ?", 7.days.ago])).each do |i|
      i.delete
    end
  end
end
