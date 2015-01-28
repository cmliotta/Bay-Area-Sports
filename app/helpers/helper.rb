require "pp"
helpers do
  include HTTParty

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def request_api_info(title, venue, id)
    url = "https://api.stubhub.com/search/catalog/events/v2"

    response = HTTParty.get(url, query: {title: title, venue: venue}, headers: {"Authorization" => "Bearer " + ENV['APPLICATION_TOKEN']})

    event_info = JSON.parse(response.body)
    p "EVENT INFO: ***************"
    p event_info
    p "---------------------------"

    puts "starting to list"
    puts "#{event_info["events"].size} events."
    event_info["events"].each do |event|
      puts event["title"]
      puts event["dateLocal"]
    end
    puts "end of list"

    event_info["events"].each do |event|
      Game.create(venue: event["venue"]["name"], home_team: event["attributes"][0]["value"], date: event["dateLocal"], away_team: event["attributes"][1]["value"], team_id: id)
    end

  end

  def request_roster
    response = HTTParty.get("http://api.sportsdatallc.org/mlb-t4/event/73201122-1829-4184-996b-dbc52d0ee003.xml?api_key=" + ENV['MLB'])

    pp response

     # response["event"]["game"]["home"]["roster"]["player"].each do |player|
     #  Player.create(name: player["first_name"] + " " + player["last_name"], team_id: 5)
     # end
  end

  def get_games
  @games = []
  games = Game.order(:date)
  @games << games.where(home_team: "San Jose Sharks").first
  @games << games.where(home_team: "San Jose Earthquakes").first
  @games << games.where(home_team: "San Francisco Giants").first
  @games << games.where(home_team: "Oakland Athletics").first
  end
end
