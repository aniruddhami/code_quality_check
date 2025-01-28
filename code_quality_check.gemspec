# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'code_quality_check'
  spec.version       = '0.1.0'
  spec.summary       = 'A gem to enforce code quality checks using Git hooks'
  spec.description   = 'Integrates Overcommit with RuboCop, Rails Best Practices, and Brakeman for automated code quality checks.'
  spec.authors       = ['Aniruddha Mirajkar']
  spec.email         = ['mirajkaraniruddha@gmail.com']
  spec.files         = Dir['lib/**/*', 'templates/**/*']
  spec.homepage      = 'https://github.com/aniruddhami/code_quality_check'
  spec.license       = 'MIT'

  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'brakeman', '~> 5.4.0'
  spec.add_dependency 'rails_best_practices', '~> 1.23.2'
  spec.add_dependency 'rubocop', '~> 1.21'
end
