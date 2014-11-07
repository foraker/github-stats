class CommentsController < AdminController
  def index
    @search   = Searches::Comment.new(search_params[:search])
    @comments = @search.results.paginate(page: params[:page])
  end

  private

  def search_params
    params.permit(search: [:user_id, :repository_id])
  end
end
