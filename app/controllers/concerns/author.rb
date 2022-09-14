# frozen_string_literal: true

module Author
  extend ActiveSupport::Concern

  def variables_shared_article_controller
    @current_article = Article.find(params[:id])
    @author_id = @current_article.user.id
    @article_author_user = User.find(@author_id)
  end

  def variables_shared_comment_controller
    @current_article = Article.find(params[:article_id])
    @author_id = @current_article.user.id
    @article_author_user = User.find(@author_id)
  end

  def same_author?(user)
    current_user == user
  end
end
