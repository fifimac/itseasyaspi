class UserprofilesController < ApplicationController
  # GET /userprofiles
  # GET /userprofiles.json
  def index
    @userprofiles = Userprofile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @userprofiles }
    end
  end

  # GET /userprofiles/1
  # GET /userprofiles/1.json
  def show
    @userprofile = Userprofile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @userprofile }
    end
  end


  def new
    @user = User.find(current_user.id)
    @userprofile = Userprofile.new
    @userprofile.user_id = @user.id
    respond_to do |format|
    format.html # new.html.erb
    format.json { render json: @profile }
    end
  end

  # GET /userprofiles/1/edit
  def edit
    @userprofile = Userprofile.find(params[:id])
  end

  # POST /userprofiles
  # POST /userprofiles.json
  def create
    @userprofile = Userprofile.new(params[:userprofile])

    respond_to do |format|
      if @userprofile.save
        format.html { redirect_to @userprofile, notice: 'Userprofile was successfully created.' }
        format.json { render json: @userprofile, status: :created, location: @userprofile }
      else
        format.html { render action: "new" }
        format.json { render json: @userprofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /userprofiles/1
  # PUT /userprofiles/1.json
  def update
    @userprofile = Userprofile.find(params[:id])
    respond_to do |format|
      if @userprofile.update_attributes(params[:userprofile])
        format.html { redirect_to @userprofile, notice: 'Userprofile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @userprofile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userprofiles/1
  # DELETE /userprofiles/1.json
  def destroy
    @userprofile = Userprofile.find(params[:id])
    @userprofile.destroy

    respond_to do |format|
      format.html { redirect_to userprofiles_url }
      format.json { head :no_content }
    end
  end

  def myprofile
    profile = Userprofile.find_by_user_id(current_user.id)

    if profile.nil?
      redirect_to "/userprofiles/new"
    else
      @user = User.find(current_user.id)
      @userprofile = Userprofile.find_by_user_id(@user.id)
      redirect_to "/userprofiles/#{@userprofile.id}"
    end
  end
end
