# -*- encoding: utf-8 -*-
require File.expand_path('../lib/sabnzbd/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kevin McDermott"]
  gem.email         = ["kevin@bigkevmcd.com"]
  gem.description   = %q{sabnzbd API client}
  gem.summary       = %q{Provides access to sabnzbd servers http://www.sabnzbd.com/ }
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "sabnzbd"
  gem.require_paths = ["lib"]
  gem.version       = Sabnzbd::VERSION

  gem.add_dependency("json", ">= 1.7.4")

  gem.add_development_dependency("rspec", ">= 2.11.0")
  gem.add_development_dependency("webmock", ">= 1.8.8")
  gem.add_development_dependency("yard", ">= 0.8.2.1")
  gem.add_development_dependency("redcarpet", ">= 2.1.1")
end
