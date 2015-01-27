class CommentsController < ApplicationController

  def new
    respond_to do |format|
      format.js { @comment = Comment.new }
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.js { @comment }
      else
        format.js { render 'has_error' }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :topic_id, :parent_comment_id)
    end
end
