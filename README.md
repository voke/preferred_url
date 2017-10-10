# PreferredUrl

## Installation

```ruby
  # Gemfile
  gem 'preferred_url', github: 'voke/preferred_url'
```

## Usage

This gems finds the preferred URL (canonical url) for a given webpage focusing
on product pages.

```ruby
require 'preferred-url'

# By requesting URL
url = PreferredUrl.crawl("http://example.com")

# or provide html body
url = PreferredUrl.find(html_body)

```

## Where to look for the preferred URL?

#### The rel="canonical" link element
```html
<link rel="canonical" href="https://blog.example.com/dresses/green-dresses-are-awesome" />
```

#### Microdata markup
```html
<div itemscope itemtype="https://schema.org/Product">
  <meta itemprop="url" content="https://example.com/p/123">
</div>
```

#### Open Graph metadata using property="og:url"
```html
<meta property="og:url" content="http://www.imdb.com/title/tt0117500/" />
```

#### Specify a canonical link in your HTTP header
_Not implemented yet_
```html
Link: <http://www.example.com/downloads/white-paper.pdf>; rel="canonical"
```

#### JSON-LD markup
_Not implemented yet_
```html
<script type="application/ld+json">
	{
		"@context": "http://schema.org/",
		"@type": "Product",
		"url": "https://www.example.com/p/123"
	}
</script>
```
