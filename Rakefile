#!/usr/bin/env rake

require "bundler/gem_tasks"

desc "Update assets from Fotorama repo"
task :update do
  require File.expand_path('../lib/fotoramajs/updater', __FILE__)
  Updater.update
end

desc 'Delete all generated files'
task :clobber do
  rm_r 'pkg' rescue nil
end
