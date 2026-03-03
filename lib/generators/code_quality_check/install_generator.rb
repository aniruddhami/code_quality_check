# frozen_string_literal: true

require 'rails/generators/base'

module CodeQualityCheck
  module Generators
    # Rails generator that installs Overcommit, RuboCop, Brakeman, and Rails Best
    # Practices configuration files into a Rails project.
    #
    # Run with: +rails generate code_quality_check:install+
    #
    # Creates:
    # - config/initializers/code_quality_check.rb
    # - .overcommit.yml
    # - .rubocop.yml
    # - .git/hooks/pre-commit
    # - .git/hooks/post-checkout
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)
      desc 'This generator creates an initializer file for Overcommit'

      def install_overcommit
        # Install Overcommit
        run 'bundle exec overcommit --install'
      end

      # Define a method that copies the initializer file to the config/initializers directory
      def copy_required_files
        # Copy the initializer file to the config/initializers directory
        template 'code_quality_check.rb', 'config/initializers/code_quality_check.rb'

        # Copy the Overcommit configuration file to the root directory
        template 'overcommit.yml', '.overcommit.yml'

        # Copy the RuboCop configuration file to the root directory
        template 'rubocop.yml', '.rubocop.yml'
        
        # Copy the pre-commit hook to the .git/hooks directory
        template 'pre-commit', '.git/hooks/pre-commit', force: true
        template 'post-checkout', '.git/hooks/post-checkout', force: true
      end
    end
  end
end
