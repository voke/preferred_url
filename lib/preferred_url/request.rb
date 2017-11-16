require 'faraday'
require 'faraday_middleware'
require 'nokogiri'
require 'addressable/uri'

module PreferredUrl
  class Request

    attr_accessor :uri

    def initialize(url)
      self.uri = Addressable::URI.parse(url)
    end

    def client
      @client ||= setup_client
    end

    def setup_client
      conn = Faraday.new do |c|
        c.use FaradayMiddleware::FollowRedirects
        c.adapter Faraday.default_adapter
      end
      conn.headers["User-Agent"] = 'curl/7.43.0'
      conn
    end

    def response
      @response ||= client.get(uri.normalize)
    end

    def get
      {
        status: response.status,
        body: response.body,
        loc: response.env['url']
      }
    end

    def self.get(url)
      new(url).get
    end

  end
end
