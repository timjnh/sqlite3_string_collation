require File.join(File.dirname(__FILE__), 'lib', 'sqlite3_string_collation')
ActiveRecord::ConnectionAdapters::SQLite3Adapter.send(:include, Sqlite3StringCollation::SQLite3Adapter)
