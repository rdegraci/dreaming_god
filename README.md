# DreamingGod

An Alexa skill bridge to a database. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dreaming_god'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dreaming_god

## Usage

```ruby
json = "...JSON received from Amazon"
Alexagram.raw_json = json
@session = DreamingGod::Session.new(Alexagram.session)
@session.imagine(Alexagram.request)
```

You will need to make sure that your database has the same database schema that dreaming_god expects. 

## Development

Make sure you have installed RVM (Ruby Version Manager) onto your workstation

After checking out the repo, run `bin/setup` to install dependencies. Set up the database, run `rake db:migrate` Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rdegraci/dreaming_god.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

