class CommentsController < ApplicationController
  before_action :load_article
  
  def create
    @comment = @article.comments.new(comment_params)
    if @comment.save
      redirect_to @article, notice: "Thanks for the comment."
    else
      redirect_to @article, alert: "Comment could not be saved!"
    end
  end
  
  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to @article, notice: "Comment was deleted."
  end
  
  private
  def load_article
    @article = Article.find(params[:article_id])
  end
  
  def comment_params
    params.require(:comment).permit(:email, :body, :name)
  end
  
end
