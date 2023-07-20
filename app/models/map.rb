class Map < ApplicationRecord
  belongs_to :post
  has_many_attached :marker_image
  
  # 画像が挿入されなかった場合に表示する画像と画像サイズのバリデーション
  def get_marker_image
    unless marker_image.attached?
      file_path = Rails.root.join('app/assets/images/no_fhoto.jpg')
      marker_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    marker_image[0].variant(resize_to_limit: [200, 200]).processed
  end
end
