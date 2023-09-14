class Notification < ApplicationRecord
  belongs_to :room, optional: true
  belongs_to :dm, optional: true
  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true
  belongs_to :admin_visitor, class_name: 'Admin', foreign_key: 'visitor_id', optional: true
  belongs_to :admin_visited, class_name: 'Admin', foreign_key: 'visited_id', optional: true
end
