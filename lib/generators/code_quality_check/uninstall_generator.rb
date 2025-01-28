# frozen_string_literal: true

require 'rails/generators/base'

module CodeQualityCheck
  module Generators
    # Uninstall generator to remove Overcommit and RuboCop configuration files
    class UninstallGenerator < Rails::Generators::Base
      desc 'This generator removes Overcommit and RuboCop configuration files'

      # Remove Overcommit and RuboCop configuration files
      def remove_files
        # List of files to be removed
        files_to_remove = ['config/initializers/overcommit.rb', '.overcommit.yml', '.rubocop.yml']

        files_to_remove.each do |file|
          if File.exist?(file)
            remove_file file
            say_status('removed', file)
          end
        end
      end

      # Uninstall Overcommit
      def uninstall_overcommit
        # uninstall overcommit
        run 'bundle exec overcommit --uninstall'
      end
    end
  end
end
