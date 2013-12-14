class SkirtpatternsController < ApplicationController
  # GET /skirtpatterns
  # GET /skirtpatterns.json
  def index
    @skirtpatterns = Skirtpattern.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @skirtpatterns }
    end
  end

  # GET /skirtpatterns/1
  # GET /skirtpatterns/1.json
  def show
    @skirtpattern = Skirtpattern.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @skirtpattern }
    end
  end

  # GET /skirtpatterns/new
  # GET /skirtpatterns/new.json
  def new
    @user = User.find(current_user.id)
    @skirtpattern = Skirtpattern.new
    @skirtpattern.user_id = @user.id

    @skirtpattern.makepattern = 1
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @skirtpattern }


    end
  end
 


  # GET /skirtpatterns/1/edit
  def edit
    @skirtpattern = Skirtpattern.find(params[:id])
  end

  # POST /skirtpatterns
  # POST /skirtpatterns.json
  def create
    @skirtpattern = Skirtpattern.new(skirtpattern_params)

    respond_to do |format|
      if @skirtpattern.save
        format.html { redirect_to @skirtpattern, notice: 'Skirtpattern was successfully created.' }
        format.json { render json: @skirtpattern, status: :created, location: @skirtpattern }
      else
        format.html { render action: "new" }
        format.json { render json: @skirtpattern.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /skirtpatterns/1
  # PATCH/PUT /skirtpatterns/1.json
  def update
    @skirtpattern = Skirtpattern.find(params[:id])

    respond_to do |format|
      if @skirtpattern.update_attributes(skirtpattern_params)
        format.html { redirect_to @skirtpattern, notice: 'Skirtpattern was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @skirtpattern.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /skirtpatterns/1
  # DELETE /skirtpatterns/1.json
  def destroy
    @skirtpattern = Skirtpattern.find(params[:id])
    @skirtpattern.destroy

    respond_to do |format|
      format.html { redirect_to skirtpatterns_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def skirtpattern_params
      params.require(:skirtpattern).permit(:canvas1, :canvas2, :canvas3, :inner_radius, :length, :makepattern, :outer_radius, :skirt_type, :unit, :user_id, :waist, :waistbandLgth, :waistbandWdth)
    end
end
