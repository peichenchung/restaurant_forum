class Restaurant < ApplicationRecord
  mount_uploader :image, PhotoUploader

  #加入驗證程序,將name設為必填,若使用者未填寫餐廳名稱,就不會將這筆資料送進資料庫
  #與資料庫的互動由Model負責,所以寫在Restaurant Model中
  validates_presence_of :name
end
