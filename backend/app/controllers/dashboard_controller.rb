class DashboardController < ApplicationController
  def index
    render json: { status: 'success', message: 'You logged in successfully'}
  end
end
