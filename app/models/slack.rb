class Slack

  def self.message(data)
    json = {"channel" => $slack_channel, "username"=> $slackbot_name, "text"=> $slack_prefix + data, "icon_emoji"=> $slack_icon}.to_json
    exec("curl -X POST --data-urlencode 'payload=#{json}' #{$slack_url}")
  end

end
