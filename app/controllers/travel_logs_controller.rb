class TravelLogsController < ApplicationController
  before_action :authenticate_user!
  # authenticate user before using the website
  def index
    @travel_logs = TravelLog.order(created_at: :desc).limit(10)
    # TravelLog.order(created_at: :desc).limit(10) -> displays most recent logs, limited to a 10 per page
  end

  # def show
  # @travel_log = TravelLog.find(params[:id])
  # end

  def my_logs
  @travel_logs = current_user.travel_logs.order(created_at: :desc)
  # Show most recent logs by a specific user when user goes to My Logs
  end

  def new 
  @travel_log = TravelLog.new
  end

  def create
  destination = Destination.find_by(category: travel_log_params[:category])
  @travel_log = current_user.travel_logs.create!(travel_log_params.merge(destination: destination))
  redirect_to travel_logs_path
  end


  def edit
    @travel_log = TravelLog.find(params[:id])
  end

  def update
  @travel_log = current_user.travel_logs.find(params[:id])
  destination = Destination.find_by(category: travel_log_params[:category])
  @travel_log.update(travel_log_params.merge(destination: destination))
  redirect_to my_logs_path
  end

  def destroy
    TravelLog.find(params[:id]).destroy

    redirect_to travel_logs_path
  end

  private

  def travel_log_params
  params.require(:travel_log).permit(:category, :title, :description, :image)
  end

end

