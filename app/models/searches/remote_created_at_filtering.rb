module Searches
  module RemoteCreatedAtFiltering
    def scope_to_created_timestamps
      scope_to_created_after  if created_after?
      scope_to_created_before if created_before?
    end

    def scope_to_created_after
      self.scope = scope.created_after(created_after)
    end

    def scope_to_created_before
      self.scope = scope.created_before(created_before)
    end

    def created_after?
      created_after.present?
    end

    def created_before?
      created_before.present?
    end
  end
end
