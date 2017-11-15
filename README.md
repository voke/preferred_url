# PreferredUrl

This gem finds the preferred url (canonical url) for a given webpage focusing
on product pages.

## Installation

```ruby
  # Gemfile
  gem 'preferred_url', github: 'voke/preferred_url'
```

## Usage

```ruby
require 'preferred_url'

# By requesting URL
res = PreferredUrl.crawl("http://example.com")

p res.url # => canonical
p res.last_requested_url # => last url if redirect

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
