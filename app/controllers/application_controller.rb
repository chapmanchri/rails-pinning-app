class ApplicationController < ActionController::Base
  before_action :require_login, except: [:show, :show_by_name]

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
    @user ||= User.where("id=?",session[:user_id]).first
  end
  helper_method :current_user

  def logout
    session.delete(:user_id)
    redirect_to :login
  end

  private

  def require_login
    if current_user.nil? || session[:user_id].nil?
      redirect_to :login
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
