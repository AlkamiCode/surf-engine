class SpotsController < ApplicationController
  before_action :authorize!
  respond_to :json, :html

  def index
    respond_with Spot.where.not(latitude: nil).first(300)
    # respond_with Spot.half_batch(params[:half])
  end

  def show
    respond_with Spot.find(params[:id])
  end
end
