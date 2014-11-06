require_relative 'test_helper'

class AdminFeatureTest < FeatureTest
  def setup
    @file_contents = File.read('db/test.db')
  end

  def teardown
    File.write('db/test.db', @file_contents)
  end

  def login
    page.driver.browser.basic_authorize('novo', 'c0ff33')
  end

  def test_cant_login_without_password
    page.driver.browser.basic_authorize('fake', 'pass')
    visit '/admin'
    refute_equal 200, page.status_code
    login
    visit '/admin'
    assert_equal 200, page.status_code
  end

  def test_can_edit_a_record
    visit '/shop'
    refute page.has_content? 'edited record blah'
    login
    visit '/1/edit'
    fill_in 'product[name]', with: 'edited record blah'
    click_link_or_button 'Submit'
    visit '/shop'
    assert page.has_content? 'edited record blah'
  end

  def test_can_add_a_record
    visit '/shop'
    refute page.has_content? 'added record blah'
    login
    visit '/add_product'
    fill_in 'product[name]', with: 'added record blah'
    click_link_or_button 'Submit'
    visit '/shop'
    assert page.has_content? 'added record blah'
  end

  def test_can_delete_a_record
    login
    visit '/add_product'
    fill_in 'product[name]', with: 'to be deleted'
    click_link_or_button 'Submit'
    visit '/shop'
    assert page.has_content? 'to be deleted'
    visit '/admin'
    within 'ul.edit-product:last-child' do
      click_on 'Delete'
    end
    visit '/shop'
    refute page.has_content? 'to be deleted'
  end
end
