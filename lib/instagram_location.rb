require 'http'
require 'yaml'
require 'json'
config = YAML::safe_load(File.read('config/secret.yml'))

result = {}

def ig_path(token, location)
	"https://api.instagram.com/v1/locations/"+location+"/media/recent?access_token="+token
end

def call_url(url)
  HTTP.headers('Accept' => 'application/json').get(url)
end

#tung hai
location_id = '715635978608753'


path = ig_path(config,location_id)

result = call_url(path)

result_parse = JSON.parse(result)
result_yml = result_parse.to_yaml
puts result_yml
