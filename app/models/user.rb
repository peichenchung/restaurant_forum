class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #「使用者評論很多餐廳」的多對多關聯
  has_many :comments, dependent: :destroy #刪除user時, 刪除關聯的comments
  has_many :restaurants, through: :comments #透過此設定Rails會知道comments table扮演了Join Table的角色

  #「使用者收藏很多餐廳」的多對多關聯
  has_many :favorites, dependent: :destroy #刪除user時, 其相關favorite物件也一並被刪除
  has_many :favorited_restaurants, through: :favorites, source: :restaurant
    # 在使用者評論過的餐廳中已用過 has_many :restaurants 的設定
    # 所以這裡不能用相同設定,否則使用object.restaurants方法時會無法分辨你是要查詢評論過的餐廳還是收藏的餐廳
    # 因此收藏關係指定自定義的名稱,另加來源source告知model name

  mount_uploader :avatar, AvatarUploader

  validates_presence_of :name #註冊時name必填

  def admin?
    self.role == "admin" #會回傳True或False
  end
end
