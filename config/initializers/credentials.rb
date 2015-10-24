# Load environment vars from local file
env_file = File.join(Rails.root, '.env')
if File.exists?(env_file)
  YAML.load(File.open(env_file)).each do |key, value|
    ENV[key.to_s] = value
  end
end

$user = ENV['HARVEST_USER']
$password = ENV['HARVEST_PASSWORD']
$subdomain = ENV['HARVEST_DOMAIN'] # e.g. 'yoomee'
$email_suffix = ENV['EMAIL_SUFFIX'] # For sending outmated emails e.g. '@yoomee.com'
$slack_url = ENV['SLACK_HOOK'] # For sening slack messages
$slack_domain = ENV['SLACK_DOMAIN'] # e.g. 'yoomee'
$gitlab_token = ENV['GITLAB_TOKEN'] # For accessing gitlab commits

if (defined? Harvest) == "constant" && $subdomain.present?
  $harvest = Harvest.hardy_client(subdomain: $subdomain, username: "#{$user}@#{$subdomain}.com", password: $password)
else
  puts "ERROR: HARVEST SUBDOMAIN NOT PRESENT: #{$subdomain} OR HARVEST NOT RUNNING"
end

$hourly_rate = 66.66666666666667
$timezone = "London"
$hours_per_day = 7.5
$email_prefix = "test."
$slack_channel = "#status"
$slack_link = "https://#{$slack_domain}.slack.com/messages/test/"
$slack_icon = ":harvest:"
$slackbot_name = "Harvest"
$slack_prefix = ""
