module Searches
  class GithubUser < Base
    delegate :sort, to: :query

    def results
      sort_users
      scope
    end

    private

    def sort_users
      if sort_by_comments?
        self.scope = scope.ordered_by_comment_count
      elsif sort_by_pull_requests?
        self.scope = scope.ordered_by_pull_request_count
      else
        self.scope = scope.alphabetized
      end
    end

    def sort?
      sort.present?
    end

    def sort_by_comments?
      sort == 'comments'
    end

    def sort_by_pull_requests?
      sort == 'pull_requests'
    end

    def repository?
      repository_id.present?
    end

    def initial_scope
      ::GithubUser
    end
  end
end
