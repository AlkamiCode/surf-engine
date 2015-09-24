class DashboardController < ApplicationController
  before_action :authorize!

  def show
    @spot = Spot.first
  end
end
