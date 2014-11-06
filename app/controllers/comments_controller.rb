class CommentsController < AdminController
  def index
    @comments = Comment.newest_first
  end
end
