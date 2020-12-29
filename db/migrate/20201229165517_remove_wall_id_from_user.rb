class RemoveWallIdFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :wall_id
  end
end
