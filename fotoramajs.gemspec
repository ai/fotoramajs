# encoding: utf-8

Gem::Specification.new do |s|
  s.name        = 'fotoramajs'
  s.version     = 'VERSION'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Artem Polikarpov']
  s.email       = ['fotoramajs@gmail.com']
  s.homepage    = 'http://fotoramajs.com/'
  s.summary     = 'Fotorama is a simple, stunning, powerful JavaScript gallery.'
  s.description = 'Fotorama is a simple, stunning, powerful JavaScript ' +
                  'gallery.  This is a gem, that allow you to simple install ' +
                  'and maintain Fotorama in Rails Assets Pipeline. ' +
                  'Note, that Fotorama is a closed source commercial project.'

  s.add_dependency 'sprockets',    '>= 2'
  s.add_dependency 'jquery-rails', '>= 2.1.0'

  s.files            = ['lib/assets/javascripts/fotorama.js',
                        'lib/assets/stylesheets/fotorama.css',
                        'lib/fotoramajs.rb', 'README.md']
  s.extra_rdoc_files = ['README.md']
  s.require_path     = 'lib'
end
