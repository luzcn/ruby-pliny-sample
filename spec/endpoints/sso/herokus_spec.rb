require "spec_helper"

RSpec.describe Endpoints::Sso::Herokus do
  include Rack::Test::Methods

  describe "GET /sso/herokus" do
    it "succeeds" do
      get "/sso/herokus"
      assert_equal 200, last_response.status
    end
  end
end
