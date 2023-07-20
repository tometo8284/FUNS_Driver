class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates :post_comment, presence: true, length: { maximum: 100 }
  
  # 子モデルの絞り込み検索を許可するメソッド
  def self.ransackable_associations(auth_object = nil)
    ["post_id"]
  end
  
end
