require File.dirname(__FILE__) + '/test_helper'

class Sqlite3StringCollationTest < ActiveSupport::TestCase
  def setup
    super
    @sql = ''
    @column_class = Struct.new(:type)
    @adapter = ActiveRecord::ConnectionAdapters::SQLite3Adapter.new(:connection, :logger, :config)
  end
  
  def test_add_column_options_with_string_collation_and_string_column
    @adapter.add_column_options!(@sql, { :column => @column_class.new(:string) })
    assert_equal ' COLLATE NOCASE', @sql
  end
  
  def test_add_column_options_with_string_collation_and_string_column_with_other_options
    @adapter.add_column_options!(@sql, { :column => @column_class.new(:string), :null => false })
    assert_equal ' NOT NULL COLLATE NOCASE', @sql
  end
  
  def test_add_column_options_with_string_collation_and_non_string_column
    @adapter.add_column_options!(@sql, { :column => @column_class.new(:integer), :null => false })
    assert_equal ' NOT NULL', @sql
  end
end
