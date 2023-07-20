class Fav < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  # 子モデルの絞り込み検索を許可するメソッド
  def self.ransackable_associations(auth_object = nil)
    ["post_id"]
  end
end
