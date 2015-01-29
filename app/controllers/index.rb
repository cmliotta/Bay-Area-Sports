get '/' do
  get_games
  erb :index
end

# post '/' do
#   request_api_info("Oakland Athletics", "Coliseum", 6)
#   200
# end

# get "/roster" do
#   request_roster
# end

get "/team/:id" do
  @team = Team.find(params[:id])
  @games = @team.games.order(:date)
  erb :roster, layout: false
end

get "/team/:team_id/game/:game_id" do
  @team = Team.find(params[:team_id])
  @game = Game.find(params[:game_id])
  erb :game, layout: false
end

get '/home' do
  get_games
  erb :index, layout: false
end

post '/comment' do
  comment = Comment.create(params[:comment])
  {username: comment.user.username, body: comment.body, }.to_json
end

not_found do
  404
end

get '/dump' do
  File.read(File.join('public', 'mydb.dump'))
end

get '/sign_in' do
  redirect request_token.authorize_url
end

get '/sign_out' do
  session.clear
  redirect '/'
end

get '/auth' do
  @access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])

  session.delete(:request_token)

  username = @access_token.params[:screen_name]
  oauth_token = @access_token.token
  oauth_secret = @access_token.secret
  user = User.find_by_username(username)
  if user
    user.update_attributes(oauth_token: oauth_token, oauth_secret: oauth_secret)
  else
    user = User.create(username: username, oauth_token: oauth_token, oauth_secret: oauth_secret)
  end
  session[:user_id] = user.id

  get_games
  redirect'/'
end