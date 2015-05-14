#!/usr/bin/env rake

require "bundler/gem_tasks"

desc "Update assets from Fotorama repo"
task :update do
  require "json"
  require "httpclient"

  def github_tags(repo)
    http = HTTPClient.new
    body = http.get("https://api.github.com/repos/#{repo}/tags").body
    JSON.parse(body)
      .reject { |tag| tag['name'] =~ /[^\d\.]/ }
      .map    { |tag| Gem::Version.new(tag['name']) }
      .sort
  end

  def get(url, to)
    to.open('w') do |io|
      http = HTTPClient.new
      http.transparent_gzip_decompression = true
      io << http.get(url).body
    end
  end

  def asset(file)
    assets = Pathname(__FILE__).dirname.join('vendor/assets')

    if file.end_with? '.css' or file.end_with? '.scss'
      assets.join('stylesheets', file)
    elsif file.end_with? '.js'
      assets.join('javascripts', file)
    else
      assets.join('images', file)
    end
  end

  def fetch(tag)
    cdn = "https://cdnjs.cloudflare.com/ajax/libs/fotorama/#{tag}"
    %w(fotorama.js fotorama.css fotorama.png fotorama@2x.png).each do |file|
      get "#{cdn}/#{file}", asset(file)
    end
  end

  def convert
    css  = asset('fotorama.css')
    scss = asset('fotorama.scss')

    scss.open('w') do |io|
      io << css.read
        .gsub(/url\(/, 'image-url(')
        .gsub(/image-url\(([^'"][^\)]*)\)/, 'image-url("\1")')
    end

    css.delete
  end

  def update_version(tag)
    version_file = Pathname(__FILE__).dirname.join('lib/fotoramajs/version.rb')
    version_file.open('w') do |io|
      io << "module Fotoramajs\n  VERSION = \"#{tag}\"\nend\n"
    end
  end

  def update_gemfile_lock
    `#{Rake::DSL::RUBY} -S bundle`
  end

  puts "Fetching tags"
  tag = github_tags('artpolikarpov/fotorama').last

  require './lib/fotoramajs/version'
  if tag.to_s == Fotoramajs::VERSION
    puts "No releases, since #{ Fotoramajs::VERSION }"
  else
    puts "Load Fotorama #{tag}"
    fetch(tag)

    puts "Convert CSS to SCSS"
    convert

    puts "Update gem version"
    update_version(tag)
    update_gemfile_lock

    puts "Done"
  end
end

desc 'Delete all generated files'
task :clobber do
  rm_r 'pkg' rescue nil
end
