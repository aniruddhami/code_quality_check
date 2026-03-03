# frozen_string_literal: true

require_relative 'lib/code_quality_check/version'

Gem::Specification.new do |spec|
  spec.name          = 'code_quality_check'
  spec.version       = CodeQualityCheck::VERSION
  spec.summary       = 'Enforce code quality on every commit via Overcommit and Git hooks'
  spec.description   = <<~DESC
    Code Quality Check is a Ruby on Rails gem that runs automated quality and security
    checks on every commit using Overcommit and Git hooks. It bundles and configures
    RuboCop (style and lint), Brakeman (security), Rails Best Practices, and
    BundleAudit (CVE checks). The installer sets up a Rails initializer that verifies
    the gem is installed and ensures Overcommit hooks are present, so teams don't
    silently skip checks. Optional support for Reek, Flay, and Fasterer via
    .overcommit.yml. Requires Overcommit in your Gemfile; add the gem and run
    `rails generate code_quality_check:install` to get started.
  DESC
  spec.authors       = ['Aniruddha Mirajkar']
  spec.email         = ['mirajkaraniruddha@gmail.com']
  spec.files         = Dir['lib/**/*', 'templates/**/*']
  spec.homepage      = 'https://github.com/aniruddhami/code_quality_check'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.1.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/aniruddhami/code_quality_check'
  spec.metadata['changelog_uri'] = 'https://github.com/aniruddhami/code_quality_check/blob/main/CHANGELOG.md'
  spec.metadata['documentation_uri'] = 'https://github.com/aniruddhami/code_quality_check#readme'
  spec.metadata['github_repo'] = 'https://github.com/aniruddhami/code_quality_check'

  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'brakeman', '~> 5.4.0'
  spec.add_dependency 'bundler-audit', '~> 0.9'
  spec.add_dependency 'rails_best_practices', '~> 1.23.2'
  spec.add_dependency 'rubocop', '~> 1.21'
  spec.add_dependency 'rubocop-performance', '~> 1.23', '>= 1.23.1'

  spec.add_development_dependency 'rails', '>= 6.0', '< 9'

  spec.metadata['rubygems_mfa_required'] = 'true'
end
