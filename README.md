# CodeQualityCheck

The `CodeQualityCheck` gem integrates code quality checks into your Rails project using pre-commit hooks. It utilizes the following tools:

- **RuboCop**: A Ruby static code analyzer based on the community Ruby style guide.
- **Brakeman**: A static analysis tool for Rails applications to find security vulnerabilities.
- **Rails Best Practices**: A code metric tool for Rails projects.
- **Trailing Whitespace Detection**: Detects and removes trailing whitespace in files.

## Installation

Add the gem to your Gemfile:

```ruby
gem 'overcommit', '~> 0.30'
gem 'code_quality_check', path: 'path/to/code_quality_check'
```

After Addding Above gem run below command:

```bash
bundle install
```

## Usage

After installing the gem, run the generator to set up the code quality checks:
```bash
rails generate code_quality_check:install
```
This will:
Copy configuration files for Overcommit, RuboCop, and Rails Best Practices into your project.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aniruddhami/code_quality_check/issues.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
