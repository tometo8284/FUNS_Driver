class Category < ApplicationRecord
  has_many :posts
  
  validates :name, presence: true
  
  # 親モデルの絞り込み検索を許可するメソッド
  def self.ransackable_associations(auth_object = nil)
    ["posts"]
  end
end
