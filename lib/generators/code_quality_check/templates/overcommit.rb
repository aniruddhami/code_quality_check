# config/initializers/overcommit.rb

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
