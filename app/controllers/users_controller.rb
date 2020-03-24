class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # Renders the page for displaying the selected User record by ID, and its associated Image records
  # GET /users/1
  # GET /users/1.json
  def show
    @images = @user.images
  end

  # Renders the page for creating a new User record
  # GET /users/new
  def new
    @user = User.new
  end

  # Renders the page for modifying the selected User record
  # GET /users/1/edit
  def edit
  end

  # Creates a new User record with the given parameters and saves it to the database
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to profile_path, notice: 'User was successfully created. You are now logged in.' }
        format.json { render :show, status: :created, location: @user }
        session["user_id"] = @user.id
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # Modifies the selected User record with the given parameters and saves it to the database
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to profile_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Defines the selected User record for the controller, default is the logged-in User record
    def set_user
      if params[:id]
        @user = User.find(params[:id])
      else
        @user = current_user
      end
    end

    # Specifies the trusted parameters for the ImagesController
    def user_params
      params.require(:user).permit(:username, :password, :admin)
    end
end
