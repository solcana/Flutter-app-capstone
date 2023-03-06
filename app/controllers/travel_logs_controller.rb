class TravelLogsController < ApplicationController
  before_action :authenticate_user!
  # authenticate user before using the website
  def index
    @travel_logs = TravelLog.order(created_at: :desc).limit(10)
    # TravelLog.order(created_at: :desc).limit(10) -> displays most recent logs, limited to a 10 per page
  end


  def my_logs
  @travel_logs = current_user.travel_logs.order(created_at: :desc)
  # Show most recent logs by a specific user when user goes to My Logs
  end

  def new 
  @travel_log = TravelLog.new
  end

  def create
    TravelLog.create(params.require(:travel_log).permit(:image, :title, :category, :description))
    redirect_to travel_logs_path
  end

end

