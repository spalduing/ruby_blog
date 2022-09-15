# frozen_string_literal: true

module CommentsHelper
  def current_user_commenter?(comment)
    current_user == comment.user
  end

  def private_or_archived?(comment)
    comment.archived? || comment.private?
  end

  def display_comment?(comment)
    comment_seen_by_article_author = (current_user == comment.article.user)
    comment_seen_by_comment_author = (current_user == comment.user)
    !comment.archived? && (!comment.private? ||
                           (comment.private? && comment_seen_by_article_author) ||
                           (comment.private? && comment_seen_by_comment_author)
                          )
  end
end
