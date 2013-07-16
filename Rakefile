#!/usr/bin/env rake

require "bundler/gem_tasks"

desc "Update assets from Fotorama repo"
task :update do
  require File.expand_path('../lib/fotoramajs/updater', __FILE__)
  files = Updater.new

  puts "Fetching"
  files.fetch

  puts "Coverting"
  files.convert

  puts "Updated"
end
