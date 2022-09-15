# frozen_string_literal: true

class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def short_body
    return "#{body.split.slice(0, 60).join(' ')}..." if body.split.length >= 60

    body
  end
end
