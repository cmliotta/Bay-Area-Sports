require "pp"
helpers do
  include HTTParty


  def request_api_info(title, venue)
    url = "https://api.stubhub.com/search/catalog/events/v2"

    response = HTTParty.get(url, query: {title: title, venue: venue, status: "Active"}, headers: {"Authorization" => "Bearer " + ENV['APPLICATION_TOKEN']})

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
      Event.create(venue: event["venue"]["name"], home_team: event["attributes"][0]["value"], date: event["dateLocal"], away_team: event["attributes"][1]["value"])
    end

  end

  def request_roster
    response = HTTParty.get("http://api.sportsdatallc.org/nhl-t3/teams/44155909-0f24-11e2-8525-18a905767e44/profile.xml?api_key=" + ENV['NHL'])

    pp response["team"]["players"]["player"]

     response["team"]["players"]["player"].each do |player|
      Roster.create(player_name: player["full_name"], player_number: player["jersey_number"])
     end
  end
end




#moan6xrBdVlrksIZkPkJ5qTcPl0a
#lCvZhrfLV35oOIpo_PBOZRdK2cIa

#request["events"][1]["venue"]["name"]
