class SpotsController < ApplicationController
  before_action :authorize!
  respond_to :json, :html

  def index
    respond_with Spot.all
  end
end
