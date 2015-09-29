class SpotsController < ApplicationController
  before_action :authorize!
  respond_to :json, :html

  def index
    respond_with Spot.all.sample(100)
  end

  def show
    respond_with Spot.find(params[:id])
  end
end
