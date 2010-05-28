module Sqlite3StringCollation
  module SQLite3Adapter
    def self.included(base)
      base.class_eval do
        alias_method_chain :add_column_options!, :string_collation
      end
    end
    
    # Adds COLLATE NOCASE to the sql string if we're dealing with a string
    # column
    def add_column_options_with_string_collation!(sql, options)
      self.add_column_options_without_string_collation!(sql, options)
      sql << ' COLLATE NOCASE' if options[:column].type.eql?(:string)
    end
  end # SQLite3Adapter
end #Sqlite3StringCollation
