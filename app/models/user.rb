class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments

  mount_uploader :avatar, AvatarUploader

  validates_presence_of :name #註冊時name必填

  def admin?
    self.role == "admin" #會回傳True或False
  end
end
