class SeatmapsController < ApplicationController
	def new
		@seatmap = Seatmap.new
	end
	
	def create
    @event = Event.find(params[:event_id])
    @seatmap = @event.seatmaps.create(seatmap_params)
    redirect_to event_path(@event)
  end

  private
    def seatmap_params
      params.require(:seatmap).permit(:name)
    end
end
