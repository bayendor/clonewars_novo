ENV['RACK_ENV'] = 'test'
require './main'
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'

Capybara.app = Sinatra::Application

class FeatureTest < MiniTest::Test
  include Capybara::DSL

  def assert_ok
    assert last_response.ok?,
           "Expected OK from this responses:\n#{last_response.inspect}"
  end

  def assert_page_has(content)
    assert last_response.body.include?(content),
           ["Expected this content:", content, "in this response body:", last_response.body.inspect].join("\n")
  end

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
