# -*- encoding: utf-8 -*-
require File.expand_path('../lib/pak/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["protomouse"]
  gem.email         = ["root@protomou.se"]
  gem.description   = %q{Library for reading Quake PAK files}
  gem.summary       = %q{This library enables the reading of Quake PAK files}
  gem.homepage      = "http://github.com/protomouse/pak.git"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "pak"
  gem.require_paths = ["lib"]
  gem.version       = PAK::VERSION

  gem.add_development_dependency "rspec"
end
