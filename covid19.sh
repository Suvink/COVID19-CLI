#!/usr/bin/env ruby

require 'net/http'
require 'uri'
require 'json'

banner = File.read("./logo.txt")
puts("\e[36m#{banner}\e[0m")
puts(" \e[36mCOVID-19 Incident Report by Suvink\e[0m")

uri = URI.parse("https://coronavirus-monitor.p.rapidapi.com/coronavirus/worldstat.php")
request = Net::HTTP::Get.new(uri)
request["X-Rapidapi-Host"] = "coronavirus-monitor.p.rapidapi.com"
request["X-Rapidapi-Key"] = "7abdd38a09msh0cb3191e72b832ep138eb5jsnf99d67e5de85"

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

data = JSON.parse(response.body)
puts("\n\n")
puts("\e[31mTotal-Cases \t Total-Deaths \t Total-Recovered \t New-Cases \t New-Deaths \t Statistics-Taken-At \e[0m")
puts("\e[33m#{data['total_cases']} \t #{data['total_deaths']} \t\t #{data['total_recovered']} \t\t #{data['new_cases']} \t #{data['new_deaths']} \t\t #{data['statistic_taken_at']}\e[0m")
puts("\n")


puts("\e[36mContribute to this project: https://github.com/Suvink/covid19-homebrew\e[0m")
puts("\n\n")