class Category < ApplicationRecord
  has_many :posts
  
  validates :name, presence: true
  
  def self.ransackable_associations(auth_object = nil)
    ["posts"]
  end
end
