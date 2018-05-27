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

  def favorite
    @restaurant = Restaurant.find(params[:id])
    @restaurant.favorites.create!(user: current_user) #寫法有很多種,請參考教案
    redirect_back(fallback_location: root_path) #回上頁
  end

  def unfavorite
    @restaurant = Restaurant.find(params[:id])
    favorites = Favorite.where(restaurant: @restaurant, user: current_user)
    favorites.destroy_all #因為上述程式碼查找出來會是一個集合,所以要用destroy_all而不是destroy
    redirect_back(fallback_location: root_path)
  end

end
