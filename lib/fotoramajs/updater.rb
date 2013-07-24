require "json"
require "httpclient"

class Updater
  def self.update
    instance = new

    puts "Fetching tags"
    tag = instance.github_tags('artpolikarpov/fotorama').last

    puts "Load Fotorama #{tag}"
    instance.fetch(tag)

    puts "Convert CSS to SCSS"
    instance.convert

    puts "Update gem version"
    instance.update_version(tag)

    puts "Done."
  end

  def fetch(tag)
    cdn = "http://fotorama.s3.amazonaws.com/#{tag}"
    %w(fotorama.js fotorama.css fotorama.png fotorama@2x.png).each do |file|
      get "#{cdn}/#{file}", asset(file)
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
      io << css.read.gsub(/url\(([^\)]+)\)/, 'image-url("\1")')
    end

    css.delete
  end

  def asset(file)
    @assets ||= Pathname(__FILE__).dirname.join('../../vendor/assets')

    if file.end_with? '.css' or file.end_with? '.scss'
      @assets.join('stylesheets', file)
    elsif file.end_with? '.js'
      @assets.join('javascripts', file)
    else
      @assets.join('images', file)
    end
  end

  def version_file
    @version ||= Pathname(__FILE__).dirname.join('version.rb')
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
end
