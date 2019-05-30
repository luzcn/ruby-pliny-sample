require "spec_helper"

RSpec.describe Endpoints::Artists do
  include Committee::Test::Methods
  include Rack::Test::Methods

  def app
    Routes
  end

  def schema_path
    "./schema/schema.json"
  end

  describe 'GET /artists' do
    it 'returns correct status code and conforms to schema' do
      get '/artists'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'POST /artists' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      post '/artists', MultiJson.encode({})
      assert_equal 201, last_response.status
      assert_schema_conform
    end
  end

  describe 'GET /artists/:id' do
    it 'returns correct status code and conforms to schema' do
      get "/artists/123"
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'PATCH /artists/:id' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      patch '/artists/123', MultiJson.encode({})
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'DELETE /artists/:id' do
    it 'returns correct status code and conforms to schema' do
      delete '/artists/123'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end
end
