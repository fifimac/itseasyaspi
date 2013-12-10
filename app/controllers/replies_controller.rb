class RepliesController < ApplicationController
  #http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    #require "debugger" ; debugger
    @comment = Comment.find(params[:comment_id])
   #require "debugger" ; debugger
    @reply = @comment.replies.create(reply_params)
    redirect_to comment_path(@comment)
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @replies = @comment.replies.find(params[:id])
    @reply.destroy
    redirect_to comment_path(@comment)
  end

  private
    def reply_params
      params.require(:reply).permit(:comment, :body)
    end

end
