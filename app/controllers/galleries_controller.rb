class GalleriesController < ApplicationController
  # GET /galleries
  # GET /galleries.json

before_filter :ensure_admin, :only => [:edit, :destroy]
  def index
    @galleries = Gallery.all
    # @galleries = Gallery.order(params[:sort])

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

  # GET /galleries/1
  # GET /galleries/1.json
  def step
    @gallery = Gallery.find(params[:step])
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
    @userprofile = Userprofile.find_by_user_id(@user.id)
    @gallery = Gallery.new
    #@gallery.submitted_by = @user.id 

    @gallery.submitted_by = @userprofile.username.blank? ?  "anonymous" : @userprofile.username 
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

  #   this will ask Active Record to return all records
  # from the database for a specific 'step'.
  def step
    @galleries = Gallery.find_all_by_step(params[:id])
    @step = params[:id] #params[:id] = Step 3 : xxxx
    respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @items }

    end
  end

  def ensure_admin
      unless current_user && current_user.admin?
        render :text => "Access Error Message", :status => :unauthorized
      end
  end

  private
    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def gallery_params
      params.require(:gallery).permit(:image, :step,  :image_comment, :submitted_by, :user)
    end

end
