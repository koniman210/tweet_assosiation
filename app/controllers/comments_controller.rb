class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.tweet_id = params[:tweet_id]
    comment.save
    
    p "comment.errors.full_messages"
    p "comment.errors.full_messages"

    redirect_to tweet_path(params[:tweet_id])
  end

  def destroy
    Comment.destoroy(id: params[:id])
    redirect_to tweet_path(params[:tweet_id])

  end
  private 
  def comment_params
    params.require(:comment).permit(:body)
  end
end
