class GithubUsersController < AdminController
  def index
    @github_users = GithubUser.alphabetized.includes(:pull_requests, :comments)
  end
end
