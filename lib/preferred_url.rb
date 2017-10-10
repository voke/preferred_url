require "preferred_url/version"

module PreferredUrl

  def self.crawl(url)
    body, final_url = Request.get(url)
    base_url = "#{final_url.scheme}://#{final_url.host}"
    find(body, base_url)
  end

  def self.find(body, base_url)
    Parser.find(body, base_url)
  end

end

require 'preferred_url/request'
require 'preferred_url/parser'
