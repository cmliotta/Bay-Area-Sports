get '/' do
  get_games
  erb :index
end

post '/' do
  request_api_info("Oakland Athletics", "Coliseum", 6)
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

get '/home' do
  get_games
  erb :index, layout: false
end

not_found do
  404
end

get '/dump' do
  File.read(File.join('public', 'mydb.dump'))
end