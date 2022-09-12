# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params) if follow_author? || same_author?
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy

    redirect_to article_path(@article), status: 303
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end

  def follow_author?
    @current_article = Article.find(params[:article_id])
    @author_id = @current_article.user.id
    @article_author_user = User.find(@author_id)

    current_user.followings.include?(@article_author_user)
  end

  def same_author?
    @current_article = Article.find(params[:article_id])
    @author_id = @current_article.user.id
    @article_author_user = User.find(@author_id)

    current_user.id == @author_id
  end
end
