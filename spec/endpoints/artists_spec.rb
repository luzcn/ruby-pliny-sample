require "spec_helper"

RSpec.describe Endpoints::Artists do
  include Rack::Test::Methods

  describe "GET /artists" do
    it "succeeds" do
      get "/artists"
      assert_equal 200, last_response.status
    end
  end
end
