class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one_attached :profile_image
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :favs, dependent: :destroy
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
  validates :name, presence: true
  validates :nick_name, presence: true
  validates :email, presence: true
  validates :introduction, length: { maximum: 100 }
  
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end
  
  # 画像が挿入されなかった場合に表示する画像と画像サイズのバリデーション
  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_person.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [200, 200]).processed
  end
  # 性別のenum       
  enum gender: { unknown: 0, man: 1, woman: 2, queer: 3}        
  
  # ゲストログイン処理       
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guest"
      user.nick_name = "ゲスト"
    end
  end
end
