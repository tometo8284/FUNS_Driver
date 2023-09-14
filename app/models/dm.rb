class Dm < ApplicationRecord
  belongs_to :room
  has_many :notifications, dependent: :destroy
  
  validates :message, presence: true, length: { maximum: 50 }
end
