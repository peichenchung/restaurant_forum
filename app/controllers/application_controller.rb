class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception #預設方法
  before_action :authenticate_user!

end
