# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'initialjs-rails/version'

Gem::Specification.new do |spec|
  spec.name          = "initialjs-rails"
  spec.version       = InitialjsRails::VERSION
  spec.authors       = ["David Gil"]
  spec.email         = ["dgilperez@gmail.com"]

  spec.summary       = 'initial.js for Rails'
  spec.description   = 'initialjs-rails is an assets gem for initial.js'
  spec.homepage      = "https://github.com/dgilperez/initialjs-rails"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'railties', [">= 3.1", "< 6.0"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "appraisal"
end
