require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns

    @heredoc ||= DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
      #{table_name}
    SQL

    @heredoc.first.map(&:to_sym)
  end

  def self.finalize!
    columns.each do |column|
      define_method(column.to_sym) {instance_variable_get("@#{column}")}
      define_method("#{column.to_sym}=") {|value| instance_variable_set( @attributes[column.to_sym],value)}
  
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= to_s.tableize
    @table_name
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    params.each do |key,val|
      raise "unknown attribute #{key}" unless SQLObject.columns.include?(key.to_sym)
    
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
