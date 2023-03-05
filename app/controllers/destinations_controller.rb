class DestinationsController < ApplicationController
    def index
    @categories = Destination.distinct.pluck(:category)
  end
# Destination.distinct.pluck(:category) returns an array of strings, 
# where each string is a unique category name.
def show
    @category = params[:id]
    @travel_logs = current_user.travel_logs.joins(:destination).where(destinations: { category: @category })

  end
end
