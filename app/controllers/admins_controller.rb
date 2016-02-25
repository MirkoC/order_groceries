class AdminsController < ApplicationController
  before_filter :require_user
  before_filter -> { is_authorized? :admin }

  def index
    @users = User.where.not(id: current_user.id)
  end

end
