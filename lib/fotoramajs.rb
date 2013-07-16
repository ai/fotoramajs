# Used only for Ruby on Rails gem to tell, that gem contain `lib/assets`.
module Fotoramajs
  class Railtie < Rails::Railtie
    initializer 'fotorama.config' do |app|
      app.config.assets.precompile += ['fotorama.png', 'fotorama@2x.png']
    end
  end

  module Rails
    class Engine < ::Rails::Engine
    end
  end
end
