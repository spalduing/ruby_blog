class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: :follower_id, class_name: 'User'
  belongs_to :followed, foreign_key: :followed_id, class_name: 'User'

  validates :follower, uniqueness: { scope: :followed }
  validates :followed, uniqueness: { scope: :follower }
end
