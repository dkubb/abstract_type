# -*- encoding: utf-8 -*-

require File.expand_path('../lib/abstract/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'abstract'
  gem.version     = Abstract::VERSION.dup
  gem.authors     = [ 'Dan Kubb' ]
  gem.email       = [ 'dan.kubb@gmail.com' ]
  gem.description = 'Module to declare abstract classes and methods'
  gem.summary     = gem.description
  gem.homepage    = 'https://github.com/dkubb/abstract'

  gem.require_paths    = [ 'lib' ]
  gem.files            = `git ls-files`.split("\n")
  gem.test_files       = `git ls-files -- {spec}/*`.split("\n")
  gem.extra_rdoc_files = %w[LICENSE README.md TODO]
end
