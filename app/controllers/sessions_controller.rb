class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(id: params[:user][:id])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
