class InstitutionsController < ApplicationController
  before_filter :require_user
  before_filter :load_institution, only: [:update, :destroy]
  before_filter -> { is_authorized? :admin }

  def update
    respond_to do |format|
      if @institution.update_attributes(institutions_params)
        format.json { respond_with_bip(@institution) }
      else
        format.json { respond_with_bip(@institution) }
      end
    end
  end

  private

  def load_institution
    @institution = Institution.find(params[:id])
  end

  def institutions_params
    params.require(:institution).permit(:name, :role_name)
  end
end
