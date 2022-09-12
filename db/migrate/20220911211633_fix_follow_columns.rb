class FixFollowColumns < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :follows, :followed, :followed_id
    rename_column :follows, :follower, :follower_id
  end
end
