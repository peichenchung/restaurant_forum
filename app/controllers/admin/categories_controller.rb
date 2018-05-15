class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user! #Devise提供的驗證方法,判斷使用者是否登入
  before_action :authenticate_admin #自己寫的方法,寫在superclass的ApplicationController中
end
