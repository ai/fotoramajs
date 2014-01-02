require File.expand_path('../lib/fotoramajs/version', __FILE__)

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'fotoramajs'
  s.version     = Fotoramajs::VERSION
  s.summary     = 'Fotorama is a simple, stunning, powerful JavaScript gallery.'
  s.description = 'Fotorama is a simple, stunning, powerful JavaScript ' +
                  'gallery.  This is a gem, that allow you to simple install ' +
                  'and maintain Fotorama in Rails Assets Pipeline.'

  s.files         = `git ls-files`.split("\n")
  s.require_path  = 'lib'

  s.author      = 'Artem Polikarpov'
  s.email       = 'fotoramajs@gmail.com'
  s.homepage    = 'http://fotorama.io/'
  s.license     = 'MIT'

  s.add_dependency 'sprockets', '>= 2'
end
