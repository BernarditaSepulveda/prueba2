require 'net/http'
require 'openssl'
require 'json'

url = 'https://api.nasa.gov/planetary/earth/assets?lon=100.75&lat=1.5&date=2014-02-01&dim=0.15&api_key=DEMO_KEY'

api_key = 'tOvA3babaE1oBhCE7edhJb8eDVwpUbXrzDPsUaVL'

def get_data(url)
    uri = URI(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Get.new(uri)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    response = http.request(request)
    JSON.parse(response.read_body)
end

data = get_data(url)

puts data ['url']

# File.write('./index.html', 

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