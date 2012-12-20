# Fotorama gem package

[Fotorama] is a simple, stunning, powerful JavaScript gallery.

This is a RubyGem packager, that allow you to simple install and maintain
Fotorama in Rails Assets Pipeline.

Note, that Fotorama is a [commercial] (33 $ per one domain name).
Non-commercial and personal use of Fotorama is typically free, but is always
approved by Fotorama’s author.

Fotorama is created and maintained by Artem Polikarpov. Fotorama is subject
to copyright laws and is not an open-source software project.

[Fotorama]: http://fotoramajs.com/
[commercial]: http://fotoramajs.com/license/

## Install

1. Add `fotoramajs` gem to `Gemfile`:

   ```ruby
   gem "fotoramajs"
   ```

2. Install gems:

   ```sh
   bundle install
   ```

3. Include Fotorama script, for example, in `application.js.coffee`:

   ```coffee
   #= require fotorama
   ```

4. Include Fotorama styles, for example, in `application.css.sass`:

   ```coffee
   @import 'fotorama'
   ```
