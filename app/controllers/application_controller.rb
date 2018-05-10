class ApplicationController < ActionController::Base


private

def authenticate_admin
  unless current_user.admin? # admin? 方法寫在User model
    flash[:alert] = "Not allow!"
    redirect_to root_path
  end
end

end
