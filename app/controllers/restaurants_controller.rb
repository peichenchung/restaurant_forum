class RestaurantsController < ApplicationController
  #before_action :authenticate_user!
    #移到application_controller.rb

  #前台首頁
  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
    @categories = Category.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new
  end

  #最新動態
  def feeds
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10) #新到舊,只顯示10筆
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end

  def dashboard
    @restaurant = Restaurant.find(params[:id])
  end

end
