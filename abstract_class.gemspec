# encoding: utf-8

require File.expand_path('../lib/abstract_class/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'abstract_class'
  gem.version     = AbstractClass::VERSION.dup
  gem.authors     = [ 'Dan Kubb' ]
  gem.email       = %w[ dan.kubb@gmail.com ]
  gem.description = 'Module to declare abstract classes and methods'
  gem.summary     = gem.description
  gem.homepage    = 'https://github.com/dkubb/abstract_class'

  gem.files            = `git ls-files`.split($/)
  gem.test_files       = `git ls-files -- {spec}/*`.split($/)
  gem.extra_rdoc_files = %w[LICENSE README.md TODO]

  gem.add_development_dependency('rake',  '~> 10.0.2')
  gem.add_development_dependency('rspec', '~> 1.3.2')
end
