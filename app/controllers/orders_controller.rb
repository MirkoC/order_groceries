class OrdersController < ApplicationController
  before_filter :require_user
  before_filter -> { is_authorized? :admin }, only: :index

  def index
  end
end
