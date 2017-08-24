# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruby_event_store/rspec/matchers/version"

Gem::Specification.new do |spec|
  spec.name          = "ruby_event_store-rspec-matchers"
  spec.version       = RubyEventStore::Rspec::Matchers::VERSION
  spec.authors       = ["Jan Filipowski"]
  spec.email         = ["jachuf@gmail.com"]

  spec.summary       = %q{RSpec matchers for RubyEventStore}
  spec.description   = %q{RSpec matchers for RubyEventStore}
  spec.homepage      = "http://railseventstore.arkency.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'mutant-rspec', '~> 0.8'
  spec.add_dependency "rspec", "~> 3.0"
end
