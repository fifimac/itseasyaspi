class CommentsController < ApplicationController

  #http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to action: :show, id: @comment.id
    else
      render 'edit'
    end
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to action: :show, id: @comment.id
    else
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to action: :index
  end

  private
    def comment_params
      params.require(:comment).permit(:title, :text)
    end
end
