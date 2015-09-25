class DashboardController < ApplicationController
  before_action :authorize!

  def show
    @spots = Spot.all
  end
end
