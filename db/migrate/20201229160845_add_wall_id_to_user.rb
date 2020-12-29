class AddWallIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :wall_id, :integer
  end
end
