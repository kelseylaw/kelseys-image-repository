class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    byebug
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      format.html { render :new }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
