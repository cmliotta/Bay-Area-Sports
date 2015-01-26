get '/' do
  @events = []
  events = Event.order(:date)
  @events << events.where(home_team: "San Jose Sharks").first
  # @events << events.where(home_team: "San Jose Earthquakes").first
  @roster = Roster.all
  erb :index
end

post '/' do
  request_api_info("San Jose Earthquakes", "Avaya")
  200
end


get "/roster" do
  request_roster
end