class GalleriesController < ApplicationController
  # GET /galleries
  # GET /galleries.json
  def index
    @galleries = Gallery.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @galleries }
    end
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @gallery }
    end
  end

  # GET /galleries/new
  # GET /galleries/new.json

  # def new
  #   @gallery = Gallery.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @gallery }
  #   end
  # end

  def new
    @user = User.find(current_user.id)
    @gallery = Gallery.new
    @gallery.submitted_by = @user.id
    respond_to do |format|
    format.html # new.html.erb
    format.json { render json: @gallery }
    end
  end

  # GET /galleries/1/edit
  def edit
    @gallery = Gallery.find(params[:id])
  end

  # POST /galleries
  # POST /galleries.json
  def create
    @gallery = Gallery.new(gallery_params)

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
        format.json { render json: @gallery, status: :created, location: @gallery }
      else
        format.html { render action: "new" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /galleries/1
  # PATCH/PUT /galleries/1.json
  def update
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(gallery_params)
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to galleries_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def gallery_params
      params.require(:gallery).permit(:image, :step, :submitted_by, :user)
    end

    #def myprofile
    # def userGallery
    #   gallery = Gallery.find_by_user_id(current_user.id)
    #   if gallery.nil?
    #     redirect_to "/gallery/new"
    #   else
    #     @user = User.find(current_user.id)
    #     @gallery = Gallery.find_by_user_id(@user.id)
    #     redirect_to "/gallery/#{@gallery.id}"
    #   end
    # end
end
