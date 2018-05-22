class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments
  has_many :restaurants, through: :comments #透過此設定Rails會知道comments table扮演了Join Table的角色

  mount_uploader :avatar, AvatarUploader

  validates_presence_of :name #註冊時name必填

  # 確保格式正確
  validates_format_of :name, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true


  def admin?
    self.role == "admin" #會回傳True或False
  end
end
