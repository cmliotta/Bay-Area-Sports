require "pp"
helpers do
  include HTTParty


  def request_api_info(title, venue)
    url = "https://api.stubhub.com/search/catalog/events/v2"

    request = HTTParty.get(url, query: {title: title, venue: venue}, headers: {"Authorization" => "Bearer " + ENV['APPLICATION_TOKEN']})

  pp request

  return request
  end
end