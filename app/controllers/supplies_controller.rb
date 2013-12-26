class SuppliesController < ApplicationController
  def index
    sleep 1
    @unbought_supplies = Supply.where(bought: false)
    @bought_supplies = Supply.where(bought: true)
  end

  def new
    @supply = Supply.new
  end

  def create
    @supply = Supply.create!(params[:supply])
    #The create method is changed so that the JavaScript format is set to no redirect.
    respond_to do |format|
      format.html {redirect_to supplies_url}
      format.js
    end
  end

  def update
    @supply = Supply.find(params[:id])
    @supply.update_attributes!(params[:supply])
    respond_to do |format|
      format.html {redirect_to supplies_url}
      format.js
    end
  end

  def destroy
    @supply = Supply.destroy(params[:id])
    respond_to do |format|
      format.html {redirect_to supplies_url}
      format.js
    end
  end
end