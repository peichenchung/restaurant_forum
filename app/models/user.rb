class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments, dependent: :restrict_with_error #如果user已有評論,就不能刪除帳號
  has_many :restaurants, through: :comments #透過此設定Rails會知道comments table扮演了Join Table的角色

  mount_uploader :avatar, AvatarUploader

  validates_presence_of :name #註冊時name必填

  def admin?
    self.role == "admin" #會回傳True或False
  end
end
