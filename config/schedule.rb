every 10.minutes do
  rake "harvest:check RAILS_ENV=production"
  rake "gitlab:check RAILS_ENV=production"
end

every 1.day do
  rake "cleanup:database RAILS_ENV=production"
end
