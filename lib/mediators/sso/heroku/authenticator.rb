require 'excon'

module Mediators::SSO::Heroku
  class Authenticator < Mediators::Base
    def initialize(options={})
      @code = options[:code]
    end

    def call
      user


    end

    def get_user
      response = Excon.post
  end
end
