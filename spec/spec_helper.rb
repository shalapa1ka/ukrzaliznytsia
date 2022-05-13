require 'rails_helper'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.backtrace_exclusion_patterns = [
    /\/lib\d*\/ruby\//,
    /org\/jruby\//,
    /bin\//,
    /lib\/rspec\/(core|expectations|matchers|mocks)/
  ]

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.order = :random
  config.include Devise::Test::ControllerHelpers, :type => :controller
end
