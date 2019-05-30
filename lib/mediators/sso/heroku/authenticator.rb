module Mediators::SSO
  module Heroku
    class Authenticator < Mediators::Base
      def initialize(options = {})
        @code = options[:code]
      end

      def call
        user = get_user
      end

      def get_user
        response = Excon.post("https://id.heroku.com",
                              expected: 200,
                              path: "/oauth/tocke",
                              body: URI.encode_www_form({client_secret: Config.heroku_oauth_secret,
                                                         grant_type: :authorization_code,
                                                         code: @code
                                                        }),
                              headers: {
                                  "Content-Type" => "application/x-www-form-urlencoded"
                              })


        auth = MultiJson.load(response.body, symbolize_keys: true)
        unless token = auth.dig(:access_token)
          log fn: :get_user, \
              success: false,
              reason: :missing_access_token
          raise Pliny::Errors::Unauthorized
        end

        # Obtain the user details
        Clients::Heroku
      end
    end
  end
end
