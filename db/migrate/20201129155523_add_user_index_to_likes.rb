class AddUserIndexToLikes < ActiveRecord::Migration[5.2]
  def change
    add_reference :likes, :user, index: true
  end
end
