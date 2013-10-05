# encoding: utf-8

require File.expand_path('../lib/abstract_type/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'abstract_type'
  gem.version     = AbstractType::VERSION.dup
  gem.authors     = [ 'Dan Kubb' ]
  gem.email       = %w[ dan.kubb@gmail.com ]
  gem.description = 'Module to declare abstract classes and methods'
  gem.summary     = gem.description
  gem.homepage    = 'https://github.com/dkubb/abstract_type'
  gem.license     = 'MIT'

  gem.files            = `git ls-files`.split($/)
  gem.test_files       = `git ls-files -- spec/unit`.split($/)
  gem.extra_rdoc_files = %w[LICENSE README.md CONTRIBUTING.md TODO]

  gem.add_development_dependency('bundler', '~> 1.3', '>= 1.3.5')
end
