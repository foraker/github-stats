class PullRequestsController < AdminController
  def index
    @pull_requests = PullRequest.newest_first
  end
end
