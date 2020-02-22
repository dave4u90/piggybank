VCR.configure do |c|
  c.cassette_library_dir = 'spec/vcr'
  config.configure_rspec_metadata!
  config.default_cassette_options = { record: :new_episodes }
  c.hook_into :webmock
end
