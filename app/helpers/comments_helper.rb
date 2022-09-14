# frozen_string_literal: true

module CommentsHelper

  def current_user_not_commenter(comment)
    current_user != comment.article.user
  end

  def private_or_archived?(comment)
    comment.archived? || comment.private?
  end
end
