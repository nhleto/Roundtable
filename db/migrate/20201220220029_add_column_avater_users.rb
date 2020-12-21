class AddColumnAvaterUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avater, :string
  end
end
