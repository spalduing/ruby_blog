#20220912202843
class AddArticlesToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :article, null: true, foreign_key: true
  end
end
