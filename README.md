# GrapeseedReportProcessor

A ruby library for extracting summary data from Google DDM Reports.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'grapeseed_report_processor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install grapeseed_report_processor

## Usage

```ruby
GrapeseedReportProcessor.process(filename) #=> {}
```

The filename pattern is very specific. It needs to match the following RegExp: `/I&C_([\w]+)_by/`

The matching pattern is looking for a class name of the processor. The available processors are:

 - Browser
 - CreativeType
 - DayOfWeek
 - Device
 - Sites
 - TimeOfDay

Thus, the filename `I&C_Creative_Type_by.csv` would trigger the `CreativeType` processor.

If no processor can be determined from the filename, a `NoProcessorError` is raised with a descriptive
error message based on the reason it was not found.

The output of the `process` method is hash keyed by the insertion order. For example:

```ruby
{ '12348374' => ['300X250', 'Facebook'] }
```

At this time, we discard the extra information and just return the values that will be show in the dashboard for the specific summary.

### CLI Usage

There is also an executable included that allows you to run the script from the command line. It outputs the result as a ruby hash that can be piped to another program.

```bash
grapeseed_report_processor filename
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Testing

The tests are written using MiniTest and can be run using `rake test` or `guard`.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/grapeseed_report_processor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
