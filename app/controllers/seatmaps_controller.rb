class SeatmapsController < ApplicationController
	def new
		@seatmap = Seatmap.new
		row = @seatmap.rows.build
		row.seats.build
	end

	def create
		@seatmap = Seatmap.new(seatmap_params)
		if @seatmap.save
			redirect_to new_event_path
		else
			render 'new'
		end
  end

	def show
    @seatmap = Seatmap.find(params[:id])
  end

  def edit
    @seatmap = Seatmap.find(params[:id])
  end

  def update
    @seatmap = Seatmap.find(params[:id])

    if @seatmap.update(seatmap_params)
      redirect_to event_path(@seatmap.event_id)
    else
      render 'edit'
    end
  end

  def destroy
    @seatmap = Seatmap.find(params[:id])
    @seatmap.destroy

    redirect_to events_path
  end

  private
    def seatmap_params
      params.require(:seatmap).permit(:name, :rows => [:name, :x_coord, :y_coord, :seats => [ :number ]])
    end
end
