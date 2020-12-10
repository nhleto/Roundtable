class AddOwnerToGroupsAndStatusToMembership < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :owner_id, :integer
    add_column :memberships, :admin, :boolean
  end
end
