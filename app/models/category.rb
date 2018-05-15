class Category < ApplicationRecord
  validates_presence_of :name #必填欄位
  validates_uniqueness_of :name #確定新增的分類不會有重複的

  has_many :restaurants
end
