require 'net/http'
require 'openssl'
require 'json'

url = 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key='
api_key = '0ecNTq6ZU792tirZ6bBKS3M3bWKGE8DJAdeYSOE9'

def get_data(url,api_key)
    uri = URI(url + api_key)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    response = http.request(request)
    JSON.parse(response.read_body)
end

data = get_data(url, api_key)

print data

File.write('./index.html', data) 

# n_externo = ARGV[0].to_i
# n_interno = ARGV[1].to_i

# puts "<html>"
# puts "<head>"
# puts "</head>"
# puts "<body>"
# puts "<ul>"
# n_externo.times do |j|
#     puts "<li>\n"
#     puts "\t<ul>"
#     n_interno.times do |i|
#         puts "<li> #{j}.#{i} </li>"
#     end
#     puts "\t</ul>"
#     puts "</li>"
# end
# puts "</ul>"
# puts "</body>"
# puts "</html>")