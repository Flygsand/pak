RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = 'random'
end

require "rubygems"
require "bundler/setup"

$:.unshift File.join(File.expand_path(File.dirname(__FILE__)), "..", "lib")

require "pak"