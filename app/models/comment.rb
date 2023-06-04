class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  def self.ransackable_associations(auth_object = nil)
    ["post_id"]
  end
  
end
