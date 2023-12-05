class ApplicationController < ActionController::Base
  include UsersHelper
  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  helper_method :current_user, :user_signed_in?
  private

  def authenticate_user!
    if not user_signed_in?
      respond_to do |format|
        format.html{
          redirect_to sign_in_users_path,alert: '請登入會員'
        }
        format.json{
          render json: {
            message: '請先登入會員',
            url: sign_in_users_path
          }, status: 401
        }
      end
    end
  end

  #負責宣染404頁面
  def not_found
    render file: Rails.public_path.join('404.html'), status: 404, layout: false
  end

  def current_user
    @__user__ ||= User.find_by(id: session[:__user_ticket__])
  end

  def user_signed_in?
    current_user.present?
  end
  
  
end
