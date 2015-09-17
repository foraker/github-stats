class GithubUsersController < AdminController
  def index
    @github_users = Searches::GithubUser.new(params).results
  end
end
