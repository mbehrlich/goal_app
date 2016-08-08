class CommentsController < ApplicationController

  before_action :ensure_login
  before_action :ensure_owner, only: [:destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.save
    flash[:errors] = @comment.errors.full_messages
    if @comment.commentable_type == "Goal"
      redirect_to goal_url(@comment.commentable_id)
    else
      redirect_to user_url(@comment.commentable_id)
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment_type = @comment.commentable_type
    @parent_id = @comment.commentable_id
    @comment.destroy
    if @comment_type == "Goal"
      redirect_to goal_url(@parent_id)
    else
      redirect_to user_url(@parent_id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :commentable_type, :commentable_id)
  end

  def ensure_owner
    @comment = Comment.find_by(id: params[:id])
    redirect_to :back unless @comment.author_id == current_user.id
  end
end
