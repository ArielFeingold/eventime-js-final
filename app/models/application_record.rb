class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :belong_to_user, ->(id) { where("user_id = ?", id) }

end
