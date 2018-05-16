class RestaurantsController < ApplicationController
  #before_action :authenticate_user!
    #移到application_controller.rb

  #前台首頁
  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
  end

end
