class RemoveWallIdFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :wall_id
  end
end
