# frozen_string_literal: true

module ArticlesHelper
  def show_body(article)
    return article.short_body if current_page?(articles_path) || current_page?(root_path)

    article.body
  end

  def display_article?(article)
    article_seen_by_author = (current_user == article.user)
    !article.archived? && (!article.private? || (article.private? && article_seen_by_author))
  end
end
