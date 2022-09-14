# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :variables_shared_comment_controller, only: %i[create destroy follow_author?]

  include Author

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params) if follow_author? || (same_author? @article_author_user)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy if same_comenter? @comment

    redirect_to article_path(@article), status: 303
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end

  def follow_author?
    current_user.followings.include?(@article_author_user)
  end

  def same_comenter?(comment)
    commenter = comment.article.user
    current_user == commenter
  end
end
