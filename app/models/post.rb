class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :favs, dependent: :destroy
  has_many :maps, dependent: :destroy
  has_many :map_lines, dependent: :destroy
  accepts_nested_attributes_for :maps, reject_if: :blank_lat_lng
  accepts_nested_attributes_for :map_lines, reject_if: :blank_linelat_linelng
  has_one_attached :image
  
  validates :title, presence: true
  validates :describe, presence: true, length: { maximum: 200 }
  validates :location, presence: true
  
  def blank_lat_lng(attributes)
    empty = !attributes['lat'].present? || !attributes['lng'].present?
    exists = attributes['id'].present?
    attributes.merge!(_destroy: 1) if exists && empty
    !exists && empty
  end
  
  def blank_linelat_linelng(attributes)
    empty = !attributes['line_lat'].present? || !attributes['line_lng'].present?
    exists = attributes['id'].present?
    attributes.merge!(_destroy: 1) if exists && empty
    !exists && empty
  end
  
  # 画像が挿入されなかった場合に表示する画像と画像サイズのバリデーション
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_fhoto.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [500, 500]).processed
  end
    
  def fav_by?(user)
    favs.exists?(user_id: user.id)
  end
  
  scope :published, -> { where(is_deleted: false) }  # 公開投稿のみ
  scope :active_user, -> { joins(:user).where( user: { is_deleted: false } ) } # 退会していないユーザーの投稿
  
  # 各モデルの絞り込み検索を許可するメソッド
  def self.ransackable_attributes(auth_object = nil)
    ["location", "category_id", "area", "prefecture", "vehicle", "created_at", "favs_count", "comments_count", "is_deleted"]
  end
  
  # いいね数をカウントし、並べ替えるメソッド
  ransacker :favs_count do
    query = '(SELECT COUNT(favs.post_id) FROM favs where favs.post_id = posts.id GROUP BY favs.post_id)'
    Arel.sql(query)
  end
  
  # コメント数をカウントし、並べ替えるメソッド
  ransacker :comments_count do
    query = '(SELECT COUNT(comments.post_id) FROM comments where comments.post_id = posts.id GROUP BY comments.post_id)'
    Arel.sql(query)
  end
  
  
  enum area: { dohoku: 0, kanto: 1, cyubu: 2, kinki: 3, cyugoku: 4, sikoku: 5, kyusyu_okinawa: 6 }

  enum prefecture: { hokkaido: 0, aomori: 1, iwate: 2, miyagi: 3, akita: 4, yamagata: 5, fukusima: 6, ibaraki: 7, tochigi: 8, gunma: 9, saitama: 10, chiba: 11, tokyo: 12, kanagawa: 13, nigata: 14, toyama: 15, ishikawa: 16, fukui: 17, yamanashi: 18, nagano: 19, gifu: 20, shizuoka: 21, aichi: 22, mie: 23, shiga: 24, kyoto: 25, osaka: 26, hyogo: 27, nara: 28, wakayama: 29, tottori: 30, simane: 31, okayama: 32, hiroshima: 33, yamaguchi: 34, tokushima: 35, kagawa: 36, ehime: 37, kochi: 38, fukuoka: 39, saga: 40, nagasaki: 41, kumamoto: 42, ooita: 43, miyazaki: 44, kagoshima: 45, okinawa: 46 }
  
  enum vehicle: { car: 0, offroad_car: 1, trak: 2, bike: 3, offroad_bike: 4, bicycle: 5, buggy: 6 }
end
