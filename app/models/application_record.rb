class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # def mutual_friends(users, current_user)
  #   (users - current_user.friends).reject { |user| user == current_user }
  # end
end
