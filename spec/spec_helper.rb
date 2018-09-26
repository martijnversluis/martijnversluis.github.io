require 'pathname'
require 'rspec'

Dir[Pathname.new(__dir__).join('support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
end
