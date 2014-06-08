class TestHelper

  # @return [Boolean] successful
  def self.test_against_rubies ruby_versions_without_patchlevel
    successes = []
    File.rename "Gemfile.lock", "Gemfile.lock.original"
    resolve_versions(ruby_versions_without_patchlevel).each do |version|
      puts "Running tests against ruby #{version}"
      File.delete "Gemfile.lock" rescue nil
      success = system(%{/bin/bash -l -c 'source "$HOME/.rvm/scripts/rvm"; rvm use #{version}; bundle install && bundle exec rspec'})
      successes << success
      unless success
        puts "Failed against ruby #{version}"
      end
    end
    File.rename "Gemfile.lock.original", "Gemfile.lock"
    successes.all?{|s| s}
  end

  private

  # map versions to patch level installed, if any
  def self.resolve_versions versions_without_patchlevel
    paths = Dir["#{ENV['HOME']}/.rvm/rubies/ruby-*"]
    versions_with_patchlevel = paths.collect{|p|p.split('ruby-').last}.sort.reverse
    versions_without_patchlevel.collect do |version|
      versions_with_patchlevel.detect do |version_with_patchlevel|
        version_with_patchlevel.start_with? "#{version}-"
      end || version
    end
  end

end
