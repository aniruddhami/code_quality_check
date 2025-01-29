# frozen_string_literal: true

require_relative 'lib/code_quality_check/version'

Gem::Specification.new do |spec|
  spec.name          = 'code_quality_check'
  spec.version       = CodeQualityCheck::VERSION
  spec.summary       = 'A gem to enforce code quality checks using Git hooks'
  spec.description   = 'Integrates Overcommit with RuboCop, Rails Best Practices, and Brakeman for automated code quality checks.'
  spec.authors       = ['Aniruddha Mirajkar']
  spec.email         = ['mirajkaraniruddha@gmail.com']
  spec.files         = Dir['lib/**/*', 'templates/**/*']
  spec.homepage      = 'https://github.com/aniruddhami/code_quality_check'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.1.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/aniruddhami/code_quality_check'
  spec.metadata['changelog_uri'] = 'https://github.com/aniruddhami/code_quality_check/CHANGELOG.md'

  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'brakeman', '~> 5.4.0'
  spec.add_dependency 'rails_best_practices', '~> 1.23.2'
  spec.add_dependency 'rubocop', '~> 1.21'
  spec.add_dependency 'rubocop-performance', '~> 1.23', '>= 1.23.1'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
end
