# frozen_string_literal: true

module PgOnlineSchemaChange
  module Helper
    def primary_key
      result = Store.get(:primary_key)
      return result if result

      Store.set(:primary_key, Query.primary_key_for(client, client.table_name))
    end
    def primary_key_columns
      result = Store.get(:primary_key_columns)
      return result if result

      Store.set(:primary_key_columns, Query.primary_key_for_v2(client, client.table_name))
    end

    def logger
      PgOnlineSchemaChange.logger
    end

    def method_missing(method, *_args)
      result = Store.send(:get, method)
      return result if result

      super
    end

    def respond_to_missing?(method_name, *args)
      result = Store.send(:get, method)
      return true if result

      super
    end
  end
end
