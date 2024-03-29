class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: '會員建立成功'
    else
      render :new
    end
  end

  def sign_in
  end

  def login
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
