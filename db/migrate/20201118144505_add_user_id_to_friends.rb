class AddUserIdToFriends < ActiveRecord::Migration[5.2]
  def change
    remove_column :friendships, :person_id, :integer
    add_column :friendships, :user_id, :integer
  end
end
