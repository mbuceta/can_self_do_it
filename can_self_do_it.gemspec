# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "can_self_do_it/version"

Gem::Specification.new do |s|
  s.name        = "can_self_do_it"
  s.version     = CanSelfDoIt::VERSION
  s.authors     = ["Juan Martín Buceta"]
  s.email       = ["mbuceta@grantaire.com.ar"]
  s.homepage    = "http:://martinbuceta.com.ar"
  s.summary     = %q{Simple can_*? like method to manage permissions}
  s.description = %q{Provide modules to work with sereveral permission policies}

  s.rubyforge_project = "can_self_do_it"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
