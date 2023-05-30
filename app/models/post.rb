class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :favs, dependent: :destroy
  
  enum area: { dohoku: 0, kanto: 1, cyubu: 2, kinki: 3, cyugoku: 4, sikoku: 5, kyusyu_okinawa: 6 }

  enum prefecture: { hokkaido: 0, aomori: 1, iwate: 2, miyagi: 3, akita: 4, yamagata: 5, fukusima: 6, ibaraki: 7, tochigi: 8, gunma: 9, saitama: 10, chiba: 11, tokyo: 12, kanagawa: 13, nigata: 14, toyama: 15, ishikawa: 16, fukui: 17, yamanashi: 18, nagano: 19, gifu: 20, shizuoka: 21, aichi: 22, mie: 23, shiga: 24, kyoto: 25, osaka: 26, hyogo: 27, nara: 28, wakayama: 29, tottori: 30, simane: 31, okayama: 32, hiroshima: 33, yamaguchi: 34, tokushima: 35, kagawa: 36, ehime: 37, kochi: 38, fukuoka: 39, saga: 40, nagasaki: 41, kumamoto: 42, ooita: 43, miyazaki: 44, kagoshima: 45, okinawa: 46 }
  
  enum vehicle: { car: 0, offroad_car: 1, trak: 2, bike: 3, offroad_bike: 4, bicycle: 5, buggy: 6 }
end
