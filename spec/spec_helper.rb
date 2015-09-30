require "simplecov"
SimpleCov.start

require 'webmock'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  def oauth_data
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(
      {
        "provider"=>"facebook",
        "uid"=>"5602546181",
        "info"=>
        {
          "name"=>"Sky Fly",
          "image"=>"http://graph.facebook.com/6025461810/picture",
        },
        "credentials"=> {
          "token"=> "555666777"
        }
      }
    )
  end
end
