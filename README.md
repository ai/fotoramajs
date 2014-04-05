# Fotorama for Ruby on Rails

[Fotorama] is a simple, stunning, powerful JavaScript gallery.

This is packager, that allows you to simply install and maintain Fotorama
by RubyGem in Rails Assets Pipeline. In development it will use local copy
and in production it will use CDN.

Fotorama was created and maintained by [Artem Polikarpov].

[Fotorama]:         http://fotorama.io/
[Artem Polikarpov]: http://artpolikarpov.ru/

## Install

1. Add `fotoramajs` gem to `Gemfile`:

   ```ruby
   gem 'fotoramajs'
   ```

2. Install gems:

   ```sh
   bundle install
   ```

3. Include jQuery in your project. I recommend [jquery-cdn]
   or [jquery-rails-cdn].
4. Put `include_fotorama` after jQuery script tag:

   ```haml
   head
     = include_jquery
     = include_fotorama
   ```
5. Use Fotorama by [documentation].

[jquery-rails-cdn]: https://github.com/kenn/jquery-rails-cdn
[documentation]:    http://fotorama.io/customize/
[jquery-cdn]:       https://github.com/ai/jquery-cdn

## Development

To update original library, you can use `rake update` task.
