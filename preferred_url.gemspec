# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'preferred_url/version'

Gem::Specification.new do |spec|
  spec.name          = "preferred_url"
  spec.version       = PreferredUrl::VERSION
  spec.authors       = ["Gustav"]
  spec.email         = ["gustav@invoke.se"]

  spec.summary       = %q{Find preferred url for product pages.}
  spec.description   = %q{Find preferred url for product pages.}
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.13.1"
  spec.add_dependency "faraday_middleware", "~> 0.12.2"
  spec.add_dependency "nokogiri", "~> 1.8.0"
  spec.add_dependency "addressable", "~> 2.5.2"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
