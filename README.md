# initialjs-rails

[initial.js](https://github.com/judesfernando/initial.js) is a simple jQuery plugin to make Gmail-like text avatars for profile pictures using SVG.

**initialjs-rails** is a wrapper to easily include it in your Rails projects using the assets pipeline.

## Installation

Add this gem to your Gemfile:

```ruby
gem 'initialjs-rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install initialjs-rails

After that add the following directive to your Javascript manifest file (application.js), after the `//= require jquery`:

    //= require initial

Add this to your application.js after page is ready:

    $('.initialjs-avatar').initial();

And finally, in your views, tag your *<img/>* class with `initialjs-avatar` class. You can use *data-attributes* as described in [initial.js](https://github.com/judesfernando/initial.js). Or you can use the helper below.

Enjoy.

## ActionView Helper

For extra simplicity, you can use this helper in your view to generate your avatar image from your model. In the following examples we'll use User, but any model responding to `:name` will do. You can also provide a `String` directly. You can learn the options available and their defaults directly from the examples:

    avatar_image(user)                       # => 100x100 image with round corners
    avatar_image(user, size: 32)             # => 32x32 image with round corners
    avatar_image(user, class: 'extra_class') # => add an extra CSS class to <img/> tag
    avatar_image(user, round_corners: false) # => disable round corners
    avatar_image(user, count: 2)             # => Number of characters shown in the image
    avatar_image(user, color: 'black')       # => Text color black. You can also provide any color in hex format: #000
    avatar_image(user, src: some_path)       # => Adds src of alternative image for browser does not support SVG

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Versioning

initialjs-rails 0.2.0 == initial.js 0.2.0

Regarding intermediate versions between initialjs releases, an extra number will be used. For example, `0.2.0.1` version reflects some change within initialjs-rails, still using initialjs' `0.2.0` version.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/initialjs-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Follow the code of conduct (CODE_OF_CONDUCT.md)
4. Commit your changes (`git commit -am 'Added some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request
