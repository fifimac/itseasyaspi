class UserprofilesController < ApplicationController

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

end
