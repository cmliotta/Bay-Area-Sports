require 'spec_helper'

describe 'GET /' do
    it "should return 200 status" do
      get "/"
    expect(last_response.status).to eq(200)
  end
end