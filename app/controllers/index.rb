get '/' do
  # @games = []
  # games = Game.order(:date)
  # @games << games.where(home_team: "San Jose Sharks").first
  # # @events << events.where(home_team: "San Jose Earthquakes").first
  # @player = Player.all
  erb :index
end

post '/' do
  request_api_info("San Jose Earthquakes", "Avaya")
  200
end

get "/roster" do
  request_roster
end

get "/roster/:id" do
  @team = Team.find(params[:id])
  erb :roster, layout: false
end