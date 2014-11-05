require_relative 'test_helper'

DB = Sequel.sqlite('db/test.db')

class DatabaseReaderTest < Minitest::Test
  def setup
    @reader = DatabaseReader.new("products")
  end

  def test_selects_all
    assert_equal DB[:products].all, @reader.select_all
  end

  def test_selects_all_by_region
    selected = DB[:products].where(region: "Africa")
    assert_equal selected.count, @reader.select_all_by_region("Africa").count
  end

  def test_selects_by_name
    selected = DB[:products].where(name: "Novo Decaf").first
    assert_equal selected, @reader.select_by_name("Novo Decaf")
  end

  def test_selects_by_type
    selected = DB[:products][type: "decaf"]
    assert_equal selected, @reader.select_by_type("decaf")
  end

  def test_selects_all_by_type
    selected = DB[:products].where(type: "decaf")
    assert_equal selected.count, @reader.select_all_by_type("decaf").count
  end

  def test_selects_all_by_that_are_not_type
    selected = DB[:products].where(Sequel.~(type: "decaf"))
    assert_equal selected.count, @reader.select_all_by_that_are_not("decaf").count
  end

  def test_selects_by_id
    selected = DB[:products][id: 7]
    assert_equal selected, @reader.select_by_id(7)
  end
end
