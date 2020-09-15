desc 'Ping PING_URL to prevent dyno sleeping'
task :dyno_ping do
  require 'net/http'

  if ENV['PING_URL']
    uri = URI.parse(ENV['PING_URL'])
    Net::HTTP.get_response(uri)
    puts 'PING!'
  end
end
