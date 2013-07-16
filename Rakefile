#!/usr/bin/env rake
require "bundler/gem_tasks"
require File.expand_path('../lib/fotoramajs/source_file', __FILE__)

desc "Update with Artem Polikarpov's fotorama Library"
task :update do
  files = SourceFile.new
  files.fetch
  files.convert

  puts "Update finished. Please, don't forget to update the gem version in gemspec."
end
