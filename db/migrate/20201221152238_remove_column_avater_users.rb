class RemoveColumnAvaterUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :avater
  end
end
