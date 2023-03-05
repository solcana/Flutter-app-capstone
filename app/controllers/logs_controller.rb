class LogsController < ApplicationController
  before_action :authenticate_user!
  def index
    @travel_logs = current_user.travel_logs
  end
end
