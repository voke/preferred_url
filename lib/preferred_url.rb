require "preferred_url/version"

module PreferredUrl

  def self.crawl(url)

    resp = Request.get(url)
    result = Result.new
    result.status_code = resp[:status]

    if resp[:status] == 200

      base_url = "#{resp[:loc].scheme}://#{resp[:loc].host}"

      result.last_requested_url = resp[:loc].to_s

      url, strategy = Parser.find(resp[:body], base_url)

      result.url = url
      result.strategy = strategy

      result

    end

    result

  end

end

require 'preferred_url/request'
require 'preferred_url/parser'
require 'preferred_url/result'
