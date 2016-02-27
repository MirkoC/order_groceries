class OrdersController < ApplicationController
  before_filter :require_user
  before_filter -> { is_authorized? :admin }

  def index
  end

  def edit
    #@order = Order.find(params[:id])
  end
end
