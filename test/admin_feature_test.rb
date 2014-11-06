require_relative 'test_helper'

class AdminFeatureTest < FeatureTest
  def test_cant_login_without_password
    page.driver.browser.basic_authorize("fake", "pass")
    visit '/admin'
    refute_equal 200, page.status_code
    page.driver.browser.basic_authorize("novo", "c0ff33")
    visit '/admin'
    assert_equal 200, page.status_code
  end
end
