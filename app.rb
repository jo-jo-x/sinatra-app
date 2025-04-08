# require "sinatra"
# require "sinatra/reloader"

# get("/") do
#   "
#   <h1>Welcome to your Sinatra App!</h1>
#   <p>Define some routes in app.rb</p>
#   "
# end
require 'uri'
require 'net/http'
require 'http'
require 'json'
require 'dotenv/load'

fkey = ENV.fetch("FORTUNE_KEY")

url = URI("https://fortune-cookie4.p.rapidapi.com/")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["x-rapidapi-key"] = fkey
request["x-rapidapi-host"] = 'fortune-cookie4.p.rapidapi.com'

response = http.request(request)
reader =  response.read_body
jsontest = JSON.parse(reader)

data = jsontest.fetch("data")
message = data.fetch("message")
puts message
