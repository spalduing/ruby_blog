# frozen_string_literal: true

class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: :follower, class_name: 'User'

  belongs_to :followed, foreign_key: :followed, class_name: 'User'
end
