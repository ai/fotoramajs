#!/usr/bin/env rake

require "bundler/gem_tasks"

desc "Update assets from Fotorama repo"
task :update do
  require "json"
  require "httpclient"

  def fetch(tag)
    cdn = "http://fotorama.s3.amazonaws.com/#{tag}"
    %w(fotorama.js fotorama.css fotorama.png fotorama@2x.png).each do |file|
      from = "#{cdn}/#{file}".sub(/(.css|.js)$/, '.uncompressed\\1')
      get from, asset(file)
    end
  end

  def update_version(tag)
    version_file.open('w') do |io|
      io << "module Fotoramajs\n  VERSION = \"#{tag}\"\nend\n"
    end
  end

  def convert
    css  = asset('fotorama.css')
    scss = asset('fotorama.css.scss')

    scss.open('w') do |io|
      io << css.read.gsub(/url\(/, 'image-url(')
    end

    css.delete
  end

  def asset(file)
    @assets ||= Pathname(__FILE__).dirname.join('vendor/assets')

    if file.end_with? '.css' or file.end_with? '.scss'
      @assets.join('stylesheets', file)
    elsif file.end_with? '.js'
      @assets.join('javascripts', file)
    else
      @assets.join('images', file)
    end
  end

  def version_file
    @version ||= Pathname(__FILE__).dirname.join('lib/fotoramajs/version.rb')
  end

  def github_tags(repo)
    http = HTTPClient.new
    body = http.get("https://api.github.com/repos/#{repo}/tags").body
    response = JSON.parse(body)
    response.map { |tag| Gem::Version.new(tag['name']) }.sort
  end

  def get(url, to)
    to.open('w') do |io|
      http = HTTPClient.new
      http.transparent_gzip_decompression = true
      io << http.get(url).body
    end
  end

  puts "Fetching tags"
  tag = github_tags('artpolikarpov/fotorama').last

  puts "Load Fotorama #{tag}"
  fetch(tag)

  puts "Convert CSS to SCSS"
  convert

  puts "Update gem version"
  update_version(tag)

  puts "Done"
end

desc 'Delete all generated files'
task :clobber do
  rm_r 'pkg' rescue nil
end
