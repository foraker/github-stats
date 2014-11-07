class RepositoriesController < AdminController
  def index
    @repositories = Repository.alphabetized
  end
end
