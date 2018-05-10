class Admin::RestaurantsController < ApplicationController
  before_action :authenticate_user! #Devise提供的驗證方法
  before_action :authenticate_admin #自己寫的方法,寫在superclass的ApplicationController中

  def index
    
  end
end
