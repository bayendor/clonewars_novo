require 'sequel'

class DatabaseReader
  DB = Sequel.sqlite('db/novocoffee.db')

  attr_reader :table_name
  def initialize(table_name)
    @table_name = table_name
  end

  def select_all
    DB["SELECT * FROM #{table_name}"].all
  end

  def select_by_name(name)
    DB["SELECT * FROM #{table_name} WHERE name = \"#{name}\""].first
  end

  def select_by_region(region)
    DB["SELECT * FROM #{table_name} WHERE region = \"#{region}\""].first
  end

  def select_by_type(type)
    DB["SELECT * FROM #{table_name} WHERE type = \"#{type}\""].first
  end

  def random(num)
    select_all.sample(num)
  end

  def all_sizes(product_name)

  end

  def delete()
    
  end

  def update()
  end

  def add()
  end
end
