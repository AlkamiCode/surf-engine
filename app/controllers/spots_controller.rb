class SpotsController < ApplicationController
  before_action :authorize!
  respond_to :json, :html

  def index
    respond_with Spot.where.not(latitude: nil)
  end

  def show
    respond_with Spot.find(params[:id])
  end
end
