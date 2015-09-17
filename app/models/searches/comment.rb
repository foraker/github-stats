module Searches
  class Comment < Base
    include RemoteCreatedAtFiltering
    delegate :user_id, :repository_id, :created_after, :created_before, to: :query

    def results
      scope_to_user           if user?
      scope_to_repository     if repository?
      scope_to_created_timestamps
      scope
    end

    private

    def scope_to_user
      self.scope = scope.from_github_user(user_id)
    end

    def scope_to_repository
      self.scope = scope.for_repository(repository_id)
    end

    def user?
      user_id.present?
    end

    def repository?
      repository_id.present?
    end

    def initial_scope
      ::Comment.newest_first.includes(:github_user, :repository)
    end
  end
end
