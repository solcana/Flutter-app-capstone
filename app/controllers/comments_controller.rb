class CommentsController < ApplicationController
  def create
    @travel_log = TravelLog.find(params[:travel_log_id])
    @comment = @travel_log.comments.create(comment_params)
    redirect_to travel_log_path(@travel_log)
  end

  private
    def comment_params
     params.require(:comment).permit(:content, :user_id)
    end
end
