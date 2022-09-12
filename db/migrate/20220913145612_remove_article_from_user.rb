class RemoveArticleFromUser < ActiveRecord::Migration[7.0]
  def up
    remove_reference :users, :article, null: true, foreign_key: true
  end
end
