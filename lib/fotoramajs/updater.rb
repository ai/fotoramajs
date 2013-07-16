require "thor"
require "json"
require "httpclient"

class Updater < Thor
  REPO = "artpolikarpov/fotorama"
  include Thor::Actions

  desc "fetch source files", "fetch source files from GitHub"
  def fetch
    tag = fetch_tags.last
    self.destination_root = "vendor/assets"

    remote = "http://fotorama.s3.amazonaws.com/#{tag}"
    get "#{remote}/fotorama.css", "stylesheets/fotorama.css"
    get "#{remote}/fotorama.js", "javascripts/fotorama.js"

    %w(fotorama.png fotorama@2x.png).each do |img|
      get "#{remote}/#{img}", "images/#{img}"
    end

    self.destination_root = ""
    create_file "lib/fotoramajs/version.rb" do
      "module Fotoramajs\n  VERSION = \"#{tag}\"\nend"
    end
  end

  desc "convert css to scss file", "convert css to scss file"
  def convert
    self.destination_root = "vendor/assets"

    inside destination_root do
      conveted = "stylesheets/fotorama.css.scss"
      run("mv stylesheets/fotorama.css #{conveted}")
      gsub_file conveted, '(fotorama.png)', "('fotorama.png')"
      gsub_file conveted, '(fotorama@2x.png)', "('fotorama@2x.png')"
      gsub_file conveted, 'url(', 'image-url('
    end
  end

  private

  def fetch_tags
    http = HTTPClient.new
    body = http.get("https://api.github.com/repos/#{REPO}/tags").body
    response = JSON.parse(body)
    response.map { |tag| Gem::Version.new(tag['name']) }.sort
  end
end
