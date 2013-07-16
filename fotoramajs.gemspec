# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fotoramajs/version'

Gem::Specification.new do |s|
  s.name        = 'fotoramajs'
  s.version     = Fotoramajs::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Artem Polikarpov']
  s.email       = ['fotoramajs@gmail.com']
  s.license     = 'MIT'
  s.homepage    = 'http://fotoramajs.com/'
  s.summary     = 'Fotorama is a simple, stunning, powerful JavaScript gallery.'
  s.description = 'Fotorama is a simple, stunning, powerful JavaScript ' +
                  'gallery.  This is a gem, that allow you to simple install ' +
                  'and maintain Fotorama in Rails Assets Pipeline. ' +
                  'Note, that Fotorama is a closed source commercial project.'

  s.add_dependency 'sprockets',    '>= 2'
  s.add_dependency 'jquery-rails', '>= 2.1.0'

  s.add_development_dependency "httpclient", "~> 2.2"
  s.add_development_dependency "thor"

  s.files         = `git ls-files`.split($/)
  s.require_path  = 'lib'
end
