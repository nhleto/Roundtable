class RemoveMembershipFromGroups < ActiveRecord::Migration[5.2]
  def change
    remove_column :groups, :membership_id, :integer
  end
end
