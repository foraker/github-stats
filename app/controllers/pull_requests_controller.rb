class PullRequestsController < AdminController
  def index
    @search        = Searches::PullRequest.new(search_params[:search])
    @pull_requests = @search.results.paginate(page: params[:page])
  end

  private

  def search_params
    params.permit(search: [:user_id, :repository_id])
  end
end
