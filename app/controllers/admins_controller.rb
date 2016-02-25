class AdminsController < ApplicationController
  before_filter -> { is_authorized? :admin }

  def index
  end

end
