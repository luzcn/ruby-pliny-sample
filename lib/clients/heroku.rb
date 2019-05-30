module Clients
  class Heroku

    attr_accessor :uri, :sudo
    private :uri=, :sudo=

    def initialize(api_key: nil, sudo: true, url: nil)
      self.uri = URI.parse(url || Config.heroku_api_url)

      if api_key
        self.uri.userinfo = ":#{api_key}"
      end

      self.sudo = sudo
    end

    def get_user (id: "~")
      id = "user#{id}@heroku.com" if id.to_s =~ /\A[+-]?\d+\Z/

      response = request(
        method: :get,
        expects: 200,
        path: "/users/#{id}"
      )

      MultiJson.decode(response.body, symbolize_key: true)
    end

    # only create the client if we have the url
    def client
      @client ||= Excon.new(uri.to_s, headers: headers)
    end

    def request (options)
      client.request(options)

    rescue Excon::Errors::Unauthorized
      raise Pliny::Errors::Unauthorized
    end

    def headers
      @headers ||= {
          "Accept" => "application/vnd.heroku+json; version=3",
          "X-Heroku-Sudo" => self.sudo ? "true" : "false",
          "Heroku-Include-Deleted" => self.sudo ? "true" : "false",
          "X-Heroku-Sudo-Force" => self.sudo ? "true" : "false"
      }
    end
  end
end