class HarvestTime
  def self.daily_json_of_user(user)
    uri = URI("#{$harvest.credentials.host}/daily.json?of_user=#{user.id}")

    Net::HTTP.start(uri.host, uri.port,
      :use_ssl => uri.scheme == 'https',
      :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|

      request = Net::HTTP::Get.new uri.request_uri
      request.basic_auth $user + $email_suffix, $password

      response = http.request request # Net::HTTPResponse object
      JSON.parse(response.body).first[1]
    end
  end

end
