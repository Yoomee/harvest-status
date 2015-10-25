namespace :gitlab do
  desc "TODO"
  task check: :environment do
    #So we can overide the timestamps
    ActiveRecord::Base.record_timestamps = false
    begin
      load 'config/initializers/credentials.rb'
      require 'net/http'

      total_data = []

      Harvest::Project.gitlab_ids.each do |project|
        puts "id #{project[:id]}"
        i = 1
        data = []
        while true
          puts "page #{i}"
          response = HTTParty.get("https://gitlab.yoomee.com/api/v3/projects/#{project[:id]}/repository/commits?private_token=#{$gitlab_token}&page=#{i}")
          data += response.parsed_response
          if response.to_s == '[]' || i == 3
            total_data += data
            break
          end
          i += 1
        end
      end

      total_data.select{|x| x["created_at"] > 10.minutes.ago}.each do |d|
        TimelineItem.create(
          :user_id => $harvest.users.all.select{|u| "#{u.first_name} #{u.last_name}" == d["author_name"]},
          :notes => d["title"],
          :gitlab_project => project[:name],
          :icon => "github"
        )
      end
    ensure
      #So the timestamps work again
      ActiveRecord::Base.record_timestamps = true
    end
  end

end
