class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception #預設方法
  before_action :authenticate_user!

private

def authenticate_admin
  unless current_user.admin? # admin? 方法寫在User model
    flash[:alert] = "Not allow!"
    redirect_to root_path
  end
end

end
