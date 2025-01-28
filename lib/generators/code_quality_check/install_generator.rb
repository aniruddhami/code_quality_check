# frozen_string_literal: true

require 'rails/generators/base'

module CodeQualityCheck
  module Generators
    # Define a generator class that inherits from Rails::Generators::Base
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)
      desc 'This generator creates an initializer file for Overcommit'

      # Define a method that copies the initializer file to the config/initializers directory
      def copy_required_files
        # Copy the initializer file to the config/initializers directory
        template 'overcommit.rb', 'config/initializers/overcommit.rb'

        # Copy the Overcommit configuration file to the root directory
        template '.overcommit.yml', '.overcommit.yml'

        # Copy the RuboCop configuration file to the root directory
        template '.rubocop.yml', '.rubocop.yml'
      end
    end
  end
end
