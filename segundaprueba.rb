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

photos = data['photos'].map{|x| x['img_src']}

def build_web_page(photos)
    html="<html>"
    html+="<head>"
    html+="</head>"
    html+="<body>"
    html+="<ul>"
    photos.each do |photo|
      html+="<li><img src=\"#{photo}\"></li>\n"
    end
    html+="</ul>"
    html+="</body>"
    html+="</html>"
    File.write('output.html', html)
  end
  
  build_web_page(photos)
  