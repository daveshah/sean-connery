# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sean/connery/version'

Gem::Specification.new do |spec|
  spec.name          = "sean-connery"
  spec.version       = Sean::Connery::VERSION
  spec.authors       = ["Dave Shah"]
  spec.email         = ["david.a.shah@gmail.com"]

   spec.summary       = %q{This gem makes everything shpeshial}
   spec.description   = %q{Yep, shpeshial}
   spec.homepage      = "https://github.com/daveshah/sean-connery"
   spec.license       = "MIT"

   spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
   spec.bindir        = "exe"
   spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
   spec.require_paths = ["lib"]

   spec.add_development_dependency "bundler", "~> 1.12"
   spec.add_development_dependency "rake", "~> 10.0"
   spec.add_development_dependency "rspec", "~> 3.0"
   spec.add_development_dependency "pry"
end
