class RegionsController < ApplicationController
  before_action :set_region, except: [:index, :new, :create]

  def index
    @regions = Region.all
  end

  def new
    @region = Region.new
  end

  def edit
  end

  def create
    @region = Region.new(region_params)
    if @region.save
      flash[:notice] = "The Region has been created succesfully"
      redirect_to region_path(id: @region.id)
    else
      flash[:alert] = "The Region hasn't been created, due an error"
      render :new
    end
  end

  def update
    @region.update(region_params)
    if params[:region][:municipality_ids].present?
      Municipality.delete_municipalities(params[:region][:municipality_ids])
    end
    if @region.save
      flash[:notice] = "The Region has been updated succesfully"
      redirect_to region_path(id: @region.id)
    else
      flash[:alert] = "The Region hasn't been created, due an error"
      render :new
    end
  end

  def destroy
    @region.destroy
    redirect_to regions_path
  end

  private
  def region_params
    params.require(:region).permit(:name, :municipality_ids)
  end

  def set_region
    @region = Region.find(params[:id])
  end
end
