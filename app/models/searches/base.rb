module Searches
  class Base
    extend ActiveModel::Naming
    include ActiveModel::Conversion

    attr_accessor :query, :scope

    def initialize(query)
      self.query = OpenStruct.new(query)
      self.scope = initial_scope
    end

    def persisted?
      false
    end
  end
end
