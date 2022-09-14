# frozen_string_literal: true

module ArticlesHelper
  def show_body(article)
    return article.short_body if current_page?(articles_path) || current_page?(root_path)

    article.body
  end

  def private_or_archived?(article)
    article.archived? || article.private?
  end
end
