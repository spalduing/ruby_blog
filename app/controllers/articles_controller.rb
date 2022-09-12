# frozen_string_literal: true

class ArticlesController < ApplicationController
  def followings
    @current_article = Article.find(params[:id])
    @author_id = @current_article.user.id
    @article_author_user = User.find(@author_id)

    @followings = @article_author_user.followings
  end

  def followers
    @current_article = Article.find(params[:id])
    @author_id = @current_article.user.id
    @article_author_user = User.find(@author_id)

    @followers = @article_author_user.followers
  end

  def follow
    @current_article = Article.find(params[:id])
    @author_id = @current_article.user.id
    @article_author_user = User.find(@author_id)

    current_user.followings << @article_author_user
    redirect_to @current_article
  end

  def unfollow
    @current_article = Article.find(params[:id])
    @author_id = @current_article.user.id

    current_user.given_follows.find_by(followed: @author_id).destroy
    redirect_to @current_article
  end

  def index
    @articles = Article.all
  end

  def show
    @current_article = Article.find(params[:id])
    @author_id = @current_article.user.id
    @article_author_user = User.find(@author_id)
    @article = Article.find(params[:id])
  end

  def new
    @author_id = current_user.id
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    # @article.user = current_user
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status, :user_id)
  end
end
