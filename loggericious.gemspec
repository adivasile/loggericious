# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "loggericious/version"

Gem::Specification.new do |s|
  s.name        = "loggericious"
  s.version     = Loggericious::VERSION
  s.authors     = ["Adrian Vasile"]
  s.email       = ["adivasile07@gmail.com "]
  s.homepage    = ""
  s.summary     = %q{Adds formated output to console logs}
  s.description = %q{The summary pretty much says it all}

  s.rubyforge_project = "loggericious"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
