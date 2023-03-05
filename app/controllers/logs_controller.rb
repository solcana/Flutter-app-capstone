class LogsController < ApplicationController
  before_action :authenticate_user!
  def index
    @travel_logs = TravelLog.all
  end
end
