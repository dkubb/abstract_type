# encoding: utf-8

require 'rake'

require File.expand_path('../lib/abstract_class/version', __FILE__)

FileList['tasks/**/*.rake'].each { |task| import task }

task :default => :spec
