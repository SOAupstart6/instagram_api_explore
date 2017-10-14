require 'http'
require 'yaml'
require 'json'
config = YAML::safe_load(File.read('config/secret.yml'))

tmp = {}
result = {}
response = {}
i = 0
def ig_path(token, location)
	"https://api.instagram.com/v1/locations/"+location+"/media/recent?access_token="+token
end

def call_url(url)
  HTTP.headers('Accept' => 'application/json').get(url)
end

#tung hai
location_id = '715635978608753'


path = ig_path(config,location_id)

response = call_url(path)
tmp = JSON.parse(response)

#stupid way
tmp['data'].each do |id|
  result[i] = id['images']['standard_resolution']['url']
  i+=1
end

#puts result
#result_yml = result_parse.to_yaml
#puts result_yml
File.write('../spec/fixtures/response.yml', response.to_yaml)
File.write('../spec/fixtures/result.yml', result.to_yaml)