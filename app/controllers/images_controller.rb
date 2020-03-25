class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # Returns all Image records that are publicly shared, with title, description, and user filters applied (if available)
  # GET /images
  # GET /images.json
  def index
    @images = Image.filter_public
    @images = @images.filter_title(params[:title]) if params[:title].present?
    @images = @images.filter_description(params[:description]) if params[:description].present?
    @images = @images.filter_user(params[:username]) if params[:username].present?
    @images = @images.order("created_at DESC")
  end

  # Returns the specified Image record by Image id
  # GET /images/1
  # GET /images/1.json
  def show
  end

  # Renders the form for creating a new Image record
  # GET /images/new
  def new
    @image = Image.new
  end

  # Renders the form for modifying the selected Image record
  # GET /images/1/edit
  def edit
  end

  # Creates a new Image record with the given parameters and saves it to the database
  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)
    @image.user_id = current_user.id
    if image_params[:picture].present?
      resized_image = MiniMagick::Image.new(image_params[:picture].tempfile.path)
      resized_image.resize('400x400')
    end

    respond_to do |format|
      if image_params[:picture].present? && @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new, notice: 'Image was unable to be saved.' }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # Modifies the selected Image record with the given parameters and saves it to the database
  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    if image_params[:picture].present?
      resized_image = MiniMagick::Image.new(image_params[:picture].path)
      resized_image.resize('200x200')
    end

    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # Deletes the selected Image record from the database
  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Sets selected image by ID
    def set_image
      @image = Image.find(params[:id])
    end

    # Specifies the trusted parameters for the ImagesController
    def image_params
      params.require(:image).permit(:title, :description, :user_id, :picture, :public, :username)
    end
end
