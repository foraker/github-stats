class GithubUsersController < AdminController
  def index
    @github_users = GithubUser.alphabetized
  end
end
