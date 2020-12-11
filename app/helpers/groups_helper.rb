module GroupsHelper
  def find_membership(user, group)
    user.memberships.find_by(group_id: group.id)
  end
end
