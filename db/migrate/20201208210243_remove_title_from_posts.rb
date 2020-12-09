class RemoveTitleFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :title, :string
  end
end
