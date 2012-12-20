# encoding: utf-8

desc 'Create gem for Rails'
task :gem => :clobber do
  require 'open-uri'

  mkdir_p 'build/lib/assets'
  cp_r    'lib/',               'build/'
  cp_r    'README.md',          'build/'

  %w{css js}.each do |ext|
    File.open("build/lib/assets/fotorama.#{ext}", 'w') do |save|
      open("http://fotoramajs.com/fotorama/fotorama.#{ext}") do |web|
        save << web.read
      end
    end
  end

  line    = File.read('build/lib/assets/fotorama.js').lines.first
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
