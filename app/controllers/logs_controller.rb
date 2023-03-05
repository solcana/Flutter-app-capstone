class LogsController < ApplicationController
  before_action :authenticate_user!
  # authenticate user before using the website
  def index
    @travel_logs = TravelLog.order(created_at: :desc).limit(10)
  end
# TravelLog.order(created_at: :desc).limit(10) -> displays most recent logs, limited to a 10 per page
  def my_logs
  @travel_logs = current_user.travel_logs.order(created_at: :desc)
end
# Show most recent logs by a specific user when user goes to My Logs
end


#   def index
  #   @travel_logs = current_user.travel_logs
  # end