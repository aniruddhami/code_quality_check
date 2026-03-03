# config/initializers/code_quality_check.rb

# Ensure code_quality_check gem is installed before setting up hooks
begin
  Gem::Specification.find_by_name('code_quality_check')
rescue Gem::MissingSpecError
  raise <<~MSG
    The code_quality_check gem is not installed.

    Add to your Gemfile:
      gem 'code_quality_check'

    Then run:
      bundle install
      rails generate code_quality_check:install
  MSG
end

if Rails.env.development? || Rails.env.test?
  begin
    # Check if Overcommit is already installed by verifying the pre-commit hook
    if File.exist?(File.join(Rails.root, '.git/hooks/pre-commit'))
      puts 'Overcommit is already installed.'
    else
      puts 'Installing Overcommit hooks...'
      system('bundle exec overcommit --install')
      system('overcommit --sign')
      system('overcommit --sign pre-commit')
    end
  rescue StandardError => e
    # Log or print any error that occurs
    Rails.logger.error "Overcommit installation failed: #{e.message}"
  end
end
