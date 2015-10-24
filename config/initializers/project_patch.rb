Harvest::Project.class_eval do
  def self.gitlab_ids
    data = []
    i = 1
    while true
      response = HTTParty.get("https://gitlab.yoomee.com/api/v3/projects?private_token=#{$gitlab_token}&page=#{i}").parsed_response
      if response.to_s == '[]'
        break
      end
      data += response.map {|x| { :id => x["id"], :name =>  x["id"]}}
      i += 1
    end
    data
  end
end
