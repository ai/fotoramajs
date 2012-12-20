# Fotorama for Ruby on Rails

[Fotorama] is a simple, stunning, powerful JavaScript gallery.

This is a RubyGem packager, that allow you to simple install and maintain
Fotorama in Rails Assets Pipeline.

Note, that Fotorama is a [commercial] and require 33 $ per one domain name.
Non-commercial and personal use of Fotorama is typically free,
but is always approved by Fotorama’s author.

Fotorama is created and maintained by [Artem Polikarpov].
It is not an open-source software project.

[Fotorama]: http://fotoramajs.com/
[commercial]: http://fotoramajs.com/license/
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

3. Include jQuery to your project. I recommend [jquery-rails-cdn].
4. Include Fotorama script, for example, in `application.js.coffee`:

   ```coffee
   #= require fotorama
   ```

5. Include Fotorama styles, for example, in `application.css.sass`:

   ```coffee
   @import 'fotorama'
   ```

[jquery-rails-cdn]: https://github.com/kenn/jquery-rails-cdn
