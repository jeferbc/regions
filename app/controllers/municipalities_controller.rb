class MunicipalitiesController < ApplicationController
  before_action :set_region
  before_action :set_municipalty, only: [:edit, :destroy, :update, :show]

  def new
    @municipality = @region.municipalities.new
  end

  def edit
  end

  def create
    @municipality = @region.municipalities.new(municipality_params)
    if @municipality.save
      flash[:notice] = "The Municipality has been created succesfully"
      redirect_to region_path(@region)
    else
      flash[:alert] = "The Municipality hasn't been created, due an error"
      render :new
    end
  end

  def update
    @municipality.update(municipality_params)
    if params[:municipality][:status] == "inactive"
      @municipality.inactive_status
    end
    if @municipality.save
      flash[:notice] = "The Municipality has been updated succesfully"
      redirect_to region_path(@region)
    else
      flash[:alert] = "The Municipality hasn't been updated, due an error"
      render :edit
    end
  end

  def destroy
    @municipality.destroy
    redirect_to region_path(@region)
  end

  private
    def municipality_params
      params.require(:municipality).permit(:name, :status)
    end

    def set_municipalty
      @municipality = @region.municipalities.find(params[:id])
    end

    def set_region
      @region = Region.find(params[:region_id])
    end
end
