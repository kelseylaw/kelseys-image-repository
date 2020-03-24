class SessionsController < ApplicationController

  # Renders the page for logging in
  def new
  end

  # Validates given login information (username, password) and sets the user session to selected User if authenticated
  def create
    @user = User.find_by(username: params[:username])
    respond_to do |format|
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        format.html { redirect_to profile_path, notice: 'Login successful!' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to login_path, notice: 'Login failed. Incorrect username or password. Please Try Again' }
        format.json { render json: {}, status: 401 }
      end
    end
  end

  # Destroys the current login session for when user wants to log out of account
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
