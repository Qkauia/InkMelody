module UsersHelper
  def current_user
    User.find_by(session[:__user_ticket__])
  end

  def user_signed_in?
    current_user.present?
  end
end
