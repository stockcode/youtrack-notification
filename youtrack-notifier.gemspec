# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'youtrack-notifier/version'

Gem::Specification.new do |spec|
  spec.name          = "youtrack-notifier"
  spec.version       = Youtrack::Notifier::VERSION
  spec.authors       = ["godwin"]
  spec.email         = ["godwin@gmail.com"]
  spec.summary       = %q{A simple wrapper for create issues to youtrack}
  spec.description   = %q{A simple wrapper for create issues to youtrack through exception notification}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", '~> 3.3.0'
  spec.add_development_dependency "youtrack"
end
