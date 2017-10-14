require 'http'
require 'yaml'

config = YAML::safe_load(File.read('config/secret.yml'))

def ig_api_path(path, location-id, ACCESS-TOKEN)
	'https://api.instagram.com/v1/locations/#{location-id}/media/recent?access_token=#{ACCESS-TOKEN}' + path
end

def call_ig_url(config, url)
	HTTP.headers(
		'Acept' => ''
		'Authorization' => ''
		).get(url)
end

ig_response = {}
ig_results = {}

repo_url = ig_api_path('')
ig_response[repo_url] = call_ig_url(config, repo_url)
repo = ig_response[repo_url].parse

ig_results['linl'] = repo['link']
ig_results['images'] = repo['images']
ig_results['location-id'] = repo[location-id]

# #老師的code
# gh_results['size'] = repo['size']
# gh_results['owner'] = repo['owner']
# gh_results['git_url'] = repo['git_url']
# gh_results['contributors_url'] = repo['contributors_url']

# contributors_url = repo['contributors_url']
# gh_response[contributors_url] = call_gh_url(config, contributors_url)
# contributors = gh_response[contributors_url].parse

# gh_results['contributors'] = contributors
# contributors.count
# contributors.map { |c| c['login']}

File.write('spec/fixture/ig_response.yml', ig_response.to_yaml)
File.write('spec/fixture/ug_result.yml', ig_results.to_yaml)