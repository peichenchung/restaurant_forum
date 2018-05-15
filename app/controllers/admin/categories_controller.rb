class Admin::CategoriesController < ApplicationController
  before_action :authenticate_user! #Devise提供的驗證方法,判斷使用者是否登入
  before_action :authenticate_admin #自己寫的方法,寫在superclass的ApplicationController中

  def index
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "category was successfully created"
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render :index
    end
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end
end
