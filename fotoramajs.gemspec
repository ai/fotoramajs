# encoding: utf-8

require './lib/fotoramajs/version'

Gem::Specification.new do |s|
  s.name        = 'fotoramajs'
  s.version     = Fotoramajs::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Artem Polikarpov']
  s.email       = ['fotoramajs@gmail.com']
  s.license     = 'MIT'
  s.homepage    = 'http://fotorama.io/'
  s.summary     = 'Fotorama is a simple, stunning, powerful JavaScript gallery.'
  s.description = 'Fotorama is a simple, stunning, powerful JavaScript ' +
                  'gallery.  This is a gem, that allow you to simple install ' +
                  'and maintain Fotorama in Rails Assets Pipeline.'

  s.add_dependency 'sprockets', '>= 2'

  s.files         = `git ls-files`.split("\n")
  s.require_path  = 'lib'
end
