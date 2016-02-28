class BuildingsController < ApplicationController
  before_filter :require_user
  before_filter :load_building, only: [:update, :destroy]
  before_filter -> { is_authorized? :admin }


  def update
    respond_to do |format|
      if @building.update_attributes(building_params)
        format.json { respond_with_bip(@building) }
      else
        format.json { respond_with_bip(@building) }
      end
    end
  end

  private

  def load_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:name, :role_name)
  end
end
