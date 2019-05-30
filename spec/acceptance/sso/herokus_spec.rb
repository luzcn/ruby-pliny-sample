require "spec_helper"

RSpec.describe Endpoints::Sso::Herokus do
  include Committee::Test::Methods
  include Rack::Test::Methods

  def app
    Routes
  end

  def schema_path
    "./schema/schema.json"
  end

  describe 'GET /sso/herokus' do
    it 'returns correct status code and conforms to schema' do
      get '/sso/herokus'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'POST /sso/herokus' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      post '/sso/herokus', MultiJson.encode({})
      assert_equal 201, last_response.status
      assert_schema_conform
    end
  end

  describe 'GET /sso/herokus/:id' do
    it 'returns correct status code and conforms to schema' do
      get "/sso/herokus/123"
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'PATCH /sso/herokus/:id' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      patch '/sso/herokus/123', MultiJson.encode({})
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'DELETE /sso/herokus/:id' do
    it 'returns correct status code and conforms to schema' do
      delete '/sso/herokus/123'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end
end
