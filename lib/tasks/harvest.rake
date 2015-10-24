namespace :harvest do
  desc "TODO"
  task check: :environment do
    #So we can overide the timestamps
    ActiveRecord::Base.record_timestamps = false
    begin
      load 'config/initializers/credentials.rb'
      require 'net/http'

      $harvest.users.all.each do |user|
        if total_json = HarvestTime.daily_json_of_user(user)
          total_json.each do |json|
            puts "Timer: #{json}"
            Timer.find_or_initialize_from_json(json)
          end
        else
          puts "No timer"
        end
      end

      TimelineItem.create_and_update_recent

      Timer.slack_recent

    ensure
      #So the timestamps work again
      ActiveRecord::Base.record_timestamps = true
    end
  end

end
