ENV['RACK_ENV'] = 'test'
require './main'
require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'

class FeatureTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    CMS
  end

  def assert_ok
    assert last_response.ok?,
           "Expected OK from this responses:\n#{last_response.inspect}"
  end

  def assert_page_has(content)
    assert last_response.body.include?(content),
           ["Expected this content:", content, "in this response body:", last_response.body.inspect].join("\n")
  end
end
