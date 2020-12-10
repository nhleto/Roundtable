class AddDefaultToAdmin < ActiveRecord::Migration[5.2]
  def change
    change_column :memberships, :admin, :boolean, default: false
  end
end
