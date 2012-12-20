# encoding: utf-8

desc 'Create gem for Rails'
task :gem => :clobber do
  require 'open-uri'

  mkdir_p 'build/lib/assets/javascripts/'
  mkdir_p 'build/lib/assets/stylesheets/'
  cp_r    'lib/',               'build/'
  cp_r    'README.md',          'build/'

  { css: 'stylesheets', js: 'javascripts' }.each_pair do |ext, dir|
    File.open("build/lib/assets/#{dir}/fotorama.#{ext}", 'w') do |save|
      open("http://fotoramajs.com/fotorama/fotorama.#{ext}") do |web|
        save << web.read
      end
    end
  end

  line    = File.read('build/lib/assets/javascripts/fotorama.js').lines.first
  version = line.match(/Fotorama ([^\s]+) /)[1]

  File.open('build/fotoramajs.gemspec', 'w') do |save|
    save << File.read('fotoramajs.gemspec').sub('VERSION', version)
  end

  cd 'build/'
  sh 'gem build fotoramajs.gemspec'

  cd '..'
  mkdir 'pkg'
  cp "build/fotoramajs-#{version}.gem", 'pkg'
  rm_r 'build'
end

desc 'Remove temporary files'
task :clobber do
  rm_r 'build' rescue nil
  rm_r 'pkg'   rescue nil
end
