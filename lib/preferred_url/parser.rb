module PreferredUrl
  class Parser

    attr_accessor :doc, :base_url

    def initialize(body, base_url)
      self.doc = Nokogiri::HTML(body)
      self.base_url = base_url
    end

    def find_canonical_url
      if link = doc.at_css('link[rel="canonical"]')
        href = link[:href].to_s
        Addressable::URI.join(base_url, href).to_s
      end
    end

    def find_itemprop_url
      tags = doc.css('[itemtype="https://schema.org/Product"] [itemprop="url"]')
      if tags.size == 1
        tags[0][:content]
      end
    end

    def find_open_graph_url
      if tag = doc.at_css('meta[property="og:url"]')
        tag[:content]
      end
    end

    def find
      find_canonical_url || find_itemprop_url || find_open_graph_url
    end

    def self.find(body, base_url)
      new(body, base_url).find
    end

  end
end
