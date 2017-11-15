require "preferred_url/version"

module PreferredUrl

  def self.crawl(url)

    body, final_url = Request.get(url)
    base_url = "#{final_url.scheme}://#{final_url.host}"

    result = Result.new
    result.last_requested_url = final_url

    url, strategy = Parser.find(body, base_url)

    result.url = url
    result.strategy = strategy

    result

  end

end

require 'preferred_url/request'
require 'preferred_url/parser'
require 'preferred_url/result'
