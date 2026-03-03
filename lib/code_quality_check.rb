# frozen_string_literal: true

require_relative 'code_quality_check/version'

# CodeQualityCheck integrates RuboCop, Brakeman, and Rails Best Practices
# with Overcommit to enforce automated code quality checks on every Git commit.
#
# @see https://github.com/aniruddhami/code_quality_check
module CodeQualityCheck
  # Base error class for CodeQualityCheck gem.
  class Error < StandardError; end
end
