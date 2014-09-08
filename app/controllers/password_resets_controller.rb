class PasswordResetsController < ApplicationController
  def new

  end

  def create
      user =User.find_by(email: params[:email])
      user.generate_password_reset_token!
      Notifier.password_reset(user).deliver
      flash[:success] = "Password email sent"
      redirect_to login_path
  end
  def edit

  end
end
