module Fotoramajs
  module Helpers
    def include_fotorama(options = {})
      options[:env] ||= ::Rails.env.to_sym

      if options[:env] == :development
        root  = ''
      else
        cdnjs = '//cdnjs.cloudflare.com/ajax/libs/'
        root  = cdnjs + "fotorama/#{ Fotoramajs::VERSION }/"
      end
        stylesheet_link_tag(root + 'fotorama.css') +
        javascript_include_tag(root + 'fotorama.js', defer: options[:defer])
    end
  end
end
