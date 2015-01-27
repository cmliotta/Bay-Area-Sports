require "pp"
helpers do
  include HTTParty


  def request_api_info(title, venue)
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
      Game.create(venue: event["venue"]["name"], home_team: event["attributes"][0]["value"], date: event["dateLocal"], away_team: event["attributes"][1]["value"], team_id: 6)
    end

  end

  def request_roster
    response = HTTParty.get("http://api.sportsdatallc.org/mlb-t4/rosters/2015.xml?api_key=" + ENV['MLB'])

    pp response
    # response["team"]["player"].each do |player|
    #   pp player["name_full"] + player["jersey_number"]
    # end

     # response["team"]["player"].each do |player|
     #  Player.create(name: player["name_full"], number: player["jersey_number"], team_id: 4)
     # end
  end
end




#moan6xrBdVlrksIZkPkJ5qTcPl0a
#lCvZhrfLV35oOIpo_PBOZRdK2cIa

#request["events"][1]["venue"]["name"]
