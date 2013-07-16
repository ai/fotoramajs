# Fotorama for Ruby on Rails

[Fotorama] is a simple, stunning, powerful JavaScript gallery.

This is packager, that allows you to simply install and maintain Fotorama
by RubyGem in Rails Assets Pipeline.

Fotorama is created and maintained by [Artem Polikarpov].

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

3. Include jQuery in your project. I recommend [jquery-rails-cdn].
4. Include Fotorama script, for example, in `application.js.coffee`:

   ```coffee
   #= require fotorama
   ```

5. Include Fotorama styles, for example, in `application.css.sass`:

   ```coffee
   @import 'fotorama'
   ```

6. Use Fotorama by [documentation].

[jquery-rails-cdn]: https://github.com/kenn/jquery-rails-cdn
[documentation]:    http://fotoramajs.com/set-up/

## Development

To update original library, you can use `rake update` task.