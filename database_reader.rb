require 'sequel'

class DatabaseReader
  # DB = Sequel.sqlite('db/novocoffee.db')

  attr_reader :table_name
  def initialize(table_name)
    @table_name = table_name
  end

  def select_all
    DB["SELECT * FROM #{table_name}"].all
  end

  def select_by_name(name)
    DB["SELECT * FROM #{table_name} WHERE name = '#{name}'"].first
  end

  def select_by_region(region)
    DB["SELECT * FROM #{table_name} WHERE region = '#{region}'"].first
  end

  def select_by_type(type)
    DB["SELECT * FROM #{table_name} WHERE type = '#{type}'"].first
  end

  def random(num)
    select_all.sample(num)
  end

  def all_sizes(product_name)
  end

  def delete(id)
    DB.run "DELETE FROM #{table_name} WHERE id = #{id}"
  end

  def update(id, options)
    changed = columns.select { |key| options[key] }
    return if changed.empty?
    set = changed.map { |key| "#{key} = '#{options[key]}'" }.join ","
    DB.run "UPDATE #{table_name} SET #{set} where id = #{id}"
  end

  def add(options)
    values = columns.map { |column| "'#{options[column]}'" }
    DB.run "INSERT INTO #{table_name} (#{columns.join ","}) VALUES (#{values.join ","})"
  end

  def columns
    @columns || [:name, :region, :type, :description, :price, :img]
  end

  def set_columns(columns)
    @columns = columns
  end
end
