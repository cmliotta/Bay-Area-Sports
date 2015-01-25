get '/' do
  erb :index
end

post '/' do
  request_api_info("San Jose Earthquakes", "Avaya")
end
