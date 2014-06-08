require "bundler/gem_tasks"
require './test_helper'

task :default => [:test_against_rubies]

task :test_against_rubies do
  ok = TestHelper.test_against_rubies %w(2.0.0 1.9.3)
  exit(ok ? 0 : 1)
end
