require "thor"
require "json"
require "httpclient"

class SourceFile < Thor
  REPO = "artpolikarpov/fotorama"
  include Thor::Actions

  desc "fetch source files", "fetch source files from GitHub"
  def fetch
    filtered_tags = fetch_tags
    tag = select("Which tag do you want to fetch?", filtered_tags)
    self.destination_root = "vendor/assets"

    remote = "http://fotorama.s3.amazonaws.com/#{tag}"
    get "#{remote}/fotorama.css", "stylesheets/fotorama.css"
    get "#{remote}/fotorama.js", "javascripts/fotorama.js"

    %w(fotorama.png fotorama@2x.png).each do |img|
      get "#{remote}/#{img}", "images/#{img}"
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
    response = JSON.parse(http.get("https://api.github.com/repos/#{REPO}/tags").body)
    response.map{|tag| Gem::Version.new(tag["name"]) }.sort
  end

  def select msg, elements
    elements.each_with_index do |element, index|
      say(block_given? ? yield(element, index + 1) : ("#{index + 1}. #{element.to_s}"))
    end
    result = ask(msg).to_i
    elements[result - 1]
  end
end