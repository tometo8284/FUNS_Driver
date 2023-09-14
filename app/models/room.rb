class Room < ApplicationRecord
  belongs_to :user
  belongs_to :admin
  has_many :dms
  has_many :notifications, dependent: :destroy
end
