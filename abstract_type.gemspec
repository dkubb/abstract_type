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

  gem.files            = `git ls-files`.split($/)
  gem.test_files       = `git ls-files -- spec/unit`.split($/)
  gem.extra_rdoc_files = %w[LICENSE README.md TODO]

  gem.add_runtime_dependency('backports', '~> 3.1', '>= 3.1.1')

  gem.add_development_dependency('rake',  '~> 10.0.4')
  gem.add_development_dependency('rspec', '~> 2.13.0')
  gem.add_development_dependency('yard',  '~> 0.8.5.2')
end
