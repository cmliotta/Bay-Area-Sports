get '/' do
  @games = []
  games = Game.order(:date)
  @games << games.where(home_team: "San Jose Sharks").first
  @games << games.where(home_team: "San Jose Earthquakes").first
  @games << games.where(home_team: "San Francisco Giants").first
  @games << games.where(home_team: "Oakland Athletics").first

  erb :index
end

post '/' do
  request_api_info("Oakland Athletics", "Coliseum")
  200
end

get "/roster" do
  request_roster
end

get "/team/:id" do
  @team = Team.find(params[:id])
  @games = @team.games.order(:date)
  erb :roster, layout: false
end