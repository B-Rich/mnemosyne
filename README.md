[![Code Climate](https://codeclimate.com/github/IcaliaLabs/mnemosyne/badges/gpa.svg)](https://codeclimate.com/github/IcaliaLabs/mnemosyne)
[![Test Coverage](https://codeclimate.com/github/IcaliaLabs/mnemosyne/badges/coverage.svg)](https://codeclimate.com/github/IcaliaLabs/mnemosyne/coverage)
[![Issue Count](https://codeclimate.com/github/IcaliaLabs/mnemosyne/badges/issue_count.svg)](https://codeclimate.com/github/IcaliaLabs/mnemosyne)
![Made with Love by Icalia Labs](https://img.shields.io/badge/With%20love%20by-Icalia%20Labs-ff3434.svg)


Mnemosyne is an open source ruby gem that acts as a wrapper for IBM Watson's [Natural Language Understanding service API](https://www.ibm.com/watson/developercloud/natural-language-understanding/api/v1/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mnemosyne'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mnemosyne

## Usage

### Configuration

In order for Mnemosyne to work correctly, it is important that you [set up an IBM Bluemix account of your own](https://console.ng.bluemix.net/) and that your trial period hasn't ended (or, for that matter, that you've registered for a paid account)

First require the `mnemosyne-bot` in your file:

```ruby
require 'mnemosyne-bot'
```

Then add the following configuration block:

```ruby

Mnemosyne::Bot.configure do |config|
	config.username = SOME_USERNAME
	config.password = SOME_PASSWORD
	config.base_uri = "https://gateway.watsonplatform.net/natural-language-understanding/api/v1"
end
```

**Note: The username and password are not your Bluemix credentials. These
credentials are specific to the Natural Language Understanding API and must
be obtained from said section of Watson's Docs**

### Analyze features of natural language content (POST)

In order analyze features of natural language content, simply use the `Mnemosyne::Bot::Analyze` class' analyze method:

```ruby
Mnemosyne::Bot::Analyze.analyze("2017-02-27", '{"text": "IBM is an American multinational technology company headquartered in Armonk, New York, United States, with operations in over 170 countries.","features": {"entities": {"emotion": true,"sentiment": true,"limit": 2},"keywords": {"emotion": true,"sentiment": true,"limit": 2}}}')
```

`Mnemosyne::Bot::Analyze.analyze` method returns an instance of `Mnemosyne::Bot::AnalyzeResult`.

[Check Watson's API reference](https://www.ibm.com/watson/developercloud/natural-language-understanding/api/v1/#post-analyze)

### Analyze features of natural language content (GET)

In order analyze features of natural language content, simply use the `Mnemosyne::Bot::Analyze` class' get_analyze method:

```ruby
Mnemosyne::Bot::Analyze.get_analyze("2017-02-27", {text: "IBM is an American multinational technology company headquartered in Armonk, New York, United States, with operations in over 170 countries.", features: ["conepts","entities","keywords"]})

```

`Mnemosyne::Bot::Analyze.get_analyze` method returns an instance of `Mnemosyne::Bot::AnalyzeResult`.


[Check Watson's API reference](https://www.ibm.com/watson/developercloud/natural-language-understanding/api/v1/#get-analyze)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mnemosyne. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
